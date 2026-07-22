import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:uuid/uuid.dart';

import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/models/models.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

const _moods = ['Happy', 'Calm', 'Tired', 'Anxious', 'Excited', 'Sad'];
const _uuid = Uuid();

class MoodScreen extends ConsumerWidget {
  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final entries = ref.watch(moodsProvider);

    return GradientScaffold(
      appBar: AppBar(
        title: Text(s.moodJournal),
        leading: IconButton(
          icon: const DirectionalIcon(PhosphorIconsRegular.caretLeft),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => _openSheet(context, ref),
        child: const Icon(PhosphorIconsRegular.plus, color: AppColors.textOnPrimary),
      ),
      body: entries.isEmpty
          ? EmptyState(
              icon: PhosphorIconsRegular.smiley,
              title: s.noMoods,
              subtitle: s.noMoodsHint,
              actionLabel: s.addMood,
              onAction: () => _openSheet(context, ref),
            )
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.page,
                AppSpacing.sm,
                AppSpacing.page,
                AppSpacing.navClearance,
              ),
              itemCount: entries.length,
              separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, i) {
                final e = entries[i];
                return SoftCard(
                  onTap: () => _openSheet(context, ref, existing: e),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.chipLavender,
                          borderRadius: BorderRadius.circular(AppRadii.md),
                        ),
                        child: Icon(_iconFor(e.mood), color: AppColors.primary, size: 24),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(s.moodLabel(e.mood), style: context.textTheme.titleMedium),
                            const SizedBox(height: AppSpacing.xxs),
                            Text(
                              e.note.isEmpty
                                  ? s.formatDate(e.date)
                                  : '${s.formatDate(e.date)} · ${e.note}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.bodySmall
                                  ?.copyWith(color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(PhosphorIconsRegular.trash, color: AppColors.danger),
                        onPressed: () async {
                          final ok = await context.confirmDelete(
                            title: s.deleteMood,
                            cancelLabel: s.cancel,
                            deleteLabel: s.delete,
                          );
                          if (!ok) return;
                          ref.read(moodsProvider.notifier).delete(e.id);
                          if (context.mounted) context.showSnack(s.moodDeleted);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  IconData _iconFor(String mood) => switch (mood.toLowerCase()) {
        'happy' || 'excited' => PhosphorIconsRegular.smiley,
        'calm' => PhosphorIconsRegular.flowerLotus,
        'tired' => PhosphorIconsRegular.moonStars,
        'anxious' => PhosphorIconsRegular.cloudLightning,
        'sad' => PhosphorIconsRegular.smileyMeh,
        _ => PhosphorIconsRegular.heart,
      };

  Future<void> _openSheet(BuildContext context, WidgetRef ref, {MoodEntry? existing}) async {
    final s = ref.read(stringsProvider);
    var selected = existing?.mood ?? _moods.first;
    final noteCtrl = TextEditingController(text: existing?.note ?? '');

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadii.xl)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.page,
            AppSpacing.lg,
            AppSpacing.page,
            MediaQuery.viewInsetsOf(ctx).bottom + AppSpacing.xl,
          ),
          child: StatefulBuilder(
            builder: (ctx, setLocal) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    existing == null ? s.howAreYouFeeling : s.editMood,
                    style: ctx.textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.xs,
                    runSpacing: AppSpacing.xs,
                    children: [
                      for (final m in _moods)
                        SoftChip(
                          label: s.moodLabel(m),
                          selected: selected == m,
                          onTap: () => setLocal(() => selected = m),
                        ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  TextField(
                    controller: noteCtrl,
                    maxLines: 3,
                    decoration: InputDecoration(hintText: s.optionalNote),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  PrimaryButton(
                    label: existing == null ? s.saveMood : s.update,
                    onPressed: () {
                      final entry = MoodEntry(
                        id: existing?.id ?? _uuid.v4(),
                        mood: selected,
                        date: existing?.date ?? DateTime.now(),
                        note: noteCtrl.text.trim(),
                        intensity: existing?.intensity ?? 3,
                      );
                      final n = ref.read(moodsProvider.notifier);
                      if (existing == null) {
                        n.add(entry);
                      } else {
                        n.update(entry);
                      }
                      Navigator.pop(ctx);
                      context.showSnack(existing == null ? s.moodSaved : s.moodUpdated);
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
    noteCtrl.dispose();
  }
}
