import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/models/models.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

final _nameFilterProvider = StateProvider<String>((ref) => 'All');

class BabyNamesScreen extends ConsumerWidget {
  const BabyNamesScreen({super.key});

  static const _filters = ['All', 'Girl', 'Boy', 'Unisex', 'Favorites'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final names = ref.watch(babyNamesProvider);
    final filter = ref.watch(_nameFilterProvider);
    final filtered = _applyFilter(names, filter);
    final theme = context.textTheme;

    return GradientScaffold(
      appBar: AppBar(
        title: Text(s.babyNames),
        leading: IconButton(
          icon: const DirectionalIcon(PhosphorIconsRegular.caretLeft),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.page,
              AppSpacing.sm,
              AppSpacing.page,
              AppSpacing.sm,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final f in _filters) ...[
                    SoftChip(
                      label: _filterLabel(s, f),
                      selected: filter == f,
                      onTap: () => ref.read(_nameFilterProvider.notifier).state = f,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                  ],
                ],
              ),
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? EmptyState(
                    icon: PhosphorIconsRegular.heartStraight,
                    title: s.noNamesHere,
                    subtitle: filter == 'Favorites'
                        ? s.tapHeartToSave
                        : s.tryAnotherFilter,
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.page,
                      AppSpacing.xs,
                      AppSpacing.page,
                      AppSpacing.navClearance,
                    ),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final n = filtered[index];
                      final accent = _genderColor(n.gender);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: SoftCard(
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: accent.withValues(alpha: 0.14),
                                  borderRadius: BorderRadius.circular(AppRadii.md),
                                ),
                                child: Icon(
                                  _genderIcon(n.gender),
                                  color: accent,
                                ),
                              ),
                              const SizedBox(width: AppSpacing.md),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      n.name,
                                      style: theme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    const SizedBox(height: AppSpacing.xxs),
                                    Text(
                                      '${s.babyNameMeaning(n.meaning)} · ${s.babyNameOrigin(n.origin)}',
                                      style: theme.bodySmall?.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                    const SizedBox(height: AppSpacing.xxs),
                                    Text(
                                      _genderLabel(s, n.gender),
                                      style: theme.labelMedium?.copyWith(
                                        color: accent,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                tooltip: n.favorite ? s.unfavorite : s.favorite,
                                onPressed: () {
                                  ref.read(babyNamesProvider.notifier).toggleFavorite(n.id);
                                },
                                icon: Icon(
                                  n.favorite
                                      ? PhosphorIconsFill.heart
                                      : PhosphorIconsRegular.heart,
                                  color: n.favorite ? AppColors.accent : AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  String _filterLabel(AppStrings s, String filter) => switch (filter) {
        'Girl' => s.girl,
        'Boy' => s.boy,
        'Unisex' => s.unisex,
        'Favorites' => s.favorites,
        _ => s.all,
      };

  String _genderLabel(AppStrings s, String gender) => switch (gender) {
        'girl' => s.girl,
        'boy' => s.boy,
        _ => s.unisex,
      };

  List<BabyName> _applyFilter(List<BabyName> names, String filter) {
    switch (filter) {
      case 'Girl':
        return names.where((n) => n.gender == 'girl').toList();
      case 'Boy':
        return names.where((n) => n.gender == 'boy').toList();
      case 'Unisex':
        return names.where((n) => n.gender == 'unisex').toList();
      case 'Favorites':
        return names.where((n) => n.favorite).toList();
      default:
        return names;
    }
  }

  Color _genderColor(String gender) {
    switch (gender) {
      case 'girl':
        return AppColors.accent;
      case 'boy':
        return AppColors.primary;
      default:
        return AppColors.success;
    }
  }

  IconData _genderIcon(String gender) {
    switch (gender) {
      case 'girl':
        return PhosphorIconsRegular.genderFemale;
      case 'boy':
        return PhosphorIconsRegular.genderMale;
      default:
        return PhosphorIconsRegular.sparkle;
    }
  }
}
