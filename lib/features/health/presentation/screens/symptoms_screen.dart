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

const _symptomNames = [
  'Morning sickness',
  'Back pain',
  'Fatigue',
  'Headache',
  'Mood swings',
  'Leg cramps',
  'Heartburn',
];
const _severities = ['mild', 'moderate', 'severe'];
const _uuid = Uuid();

class SymptomsScreen extends ConsumerWidget {
  const SymptomsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final entries = ref.watch(symptomsProvider);

    return GradientScaffold(
      appBar: AppBar(
        title: Text(s.symptoms),
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
              icon: PhosphorIconsRegular.heartbeat,
              title: s.noSymptoms,
              subtitle: s.noSymptomsHint,
              actionLabel: s.addSymptom,
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
                          color: _severityColor(e.severity).withValues(alpha: 0.16),
                          borderRadius: BorderRadius.circular(AppRadii.md),
                        ),
                        child: Icon(
                          PhosphorIconsRegular.pulse,
                          color: _severityColor(e.severity),
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(s.symptomLabel(e.name), style: context.textTheme.titleMedium),
                            const SizedBox(height: AppSpacing.xxs),
                            Text(
                              '${s.severityLabel(e.severity)} · ${s.formatDate(e.date)}'
                              '${e.note.isEmpty ? '' : ' · ${e.note}'}',
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
                            title: s.deleteSymptom,
                            cancelLabel: s.cancel,
                            deleteLabel: s.delete,
                          );
                          if (!ok) return;
                          ref.read(symptomsProvider.notifier).delete(e.id);
                          if (context.mounted) context.showSnack(s.symptomDeleted);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  Color _severityColor(String s) => switch (s) {
        'severe' => AppColors.danger,
        'moderate' => AppColors.warning,
        _ => AppColors.success,
      };

  Future<void> _openSheet(
    BuildContext context,
    WidgetRef ref, {
    SymptomEntry? existing,
  }) async {
    final s = ref.read(stringsProvider);
    var name = existing?.name ?? _symptomNames.first;
    var severity = existing?.severity ?? 'mild';
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
                    existing == null ? s.logSymptom : s.editSymptom,
                    style: ctx.textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(s.symptom, style: ctx.textTheme.labelLarge),
                  const SizedBox(height: AppSpacing.xs),
                  Wrap(
                    spacing: AppSpacing.xs,
                    runSpacing: AppSpacing.xs,
                    children: [
                      for (final n in _symptomNames)
                        SoftChip(
                          label: s.symptomLabel(n),
                          selected: name == n,
                          onTap: () => setLocal(() => name = n),
                        ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(s.severity, style: ctx.textTheme.labelLarge),
                  const SizedBox(height: AppSpacing.xs),
                  Row(
                    children: [
                      for (final sev in _severities) ...[
                        SoftChip(
                          label: s.severityLabel(sev),
                          selected: severity == sev,
                          onTap: () => setLocal(() => severity = sev),
                        ),
                        if (sev != _severities.last) const SizedBox(width: AppSpacing.xs),
                      ],
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  TextField(
                    controller: noteCtrl,
                    maxLines: 2,
                    decoration: InputDecoration(hintText: s.optionalNote),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  PrimaryButton(
                    label: existing == null ? s.save : s.update,
                    onPressed: () {
                      final entry = SymptomEntry(
                        id: existing?.id ?? _uuid.v4(),
                        name: name,
                        date: existing?.date ?? DateTime.now(),
                        severity: severity,
                        note: noteCtrl.text.trim(),
                      );
                      final n = ref.read(symptomsProvider.notifier);
                      if (existing == null) {
                        n.add(entry);
                      } else {
                        n.update(entry);
                      }
                      Navigator.pop(ctx);
                      context.showSnack(existing == null ? s.symptomSaved : s.symptomUpdated);
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
