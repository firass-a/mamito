import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

enum _JourneyMode { weeks, months, trimesters }

class JourneyScreen extends ConsumerStatefulWidget {
  const JourneyScreen({super.key});

  @override
  ConsumerState<JourneyScreen> createState() => _JourneyScreenState();
}

class _JourneyScreenState extends ConsumerState<JourneyScreen> {
  _JourneyMode _mode = _JourneyMode.weeks;
  final Set<String> _checked = {};

  void _selectWeek(int week) {
    ref.read(selectedWeekProvider.notifier).state = week;
    ref.read(profileProvider.notifier).setWeek(week);
    ref.read(babyProvider.notifier).syncWeek(week);
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(stringsProvider);
    final week = ref.watch(selectedWeekProvider);
    final weeks = ref.watch(weekContentsProvider);
    final content = weeks.firstWhere((w) => w.week == week, orElse: () => weeks.first);
    final theme = context.textTheme;

    return GradientScaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.page,
            AppSpacing.md,
            AppSpacing.page,
            AppSpacing.navClearance,
          ),
          children: [
            Text(s.journeyTitle, style: theme.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.xs),
            Text(
              s.journeySubtitle,
              style: theme.bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                for (final m in _JourneyMode.values) ...[
                  SoftChip(
                    label: switch (m) {
                      _JourneyMode.weeks => s.modeWeeks,
                      _JourneyMode.months => s.modeMonths,
                      _JourneyMode.trimesters => s.modeTrimesters,
                    },
                    selected: _mode == m,
                    onTap: () => setState(() => _mode = m),
                  ),
                  if (m != _JourneyMode.trimesters) const SizedBox(width: AppSpacing.xs),
                ],
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              height: 52,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _selectorCount,
                separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.xs),
                itemBuilder: (context, i) {
                  final value = i + 1;
                  final selected = _isSelected(value, week);
                  return GestureDetector(
                    onTap: () => _selectWeek(_weekForIndex(value)),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 52,
                      decoration: BoxDecoration(
                        color: selected ? AppColors.primary : AppColors.surface,
                        borderRadius: BorderRadius.circular(AppRadii.md),
                        boxShadow: selected ? AppShadows.glow : AppShadows.softSm,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        _labelFor(value),
                        style: theme.labelLarge?.copyWith(
                          color: selected ? AppColors.textOnPrimary : AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            SoftCard(
              gradient: AppColors.gradientCard,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${s.weekLabel} ${content.week}',
                          style: theme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
                        ),
                      ),
                      SoftChip(
                        label: s.fruitLabel(content.fruitComparison),
                        selected: true,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    s.babySizeOf(s.fruitLabel(content.fruitComparison)),
                    style: theme.bodyMedium?.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  SecondaryButton(
                    label: s.viewBabyDetails,
                    onPressed: () => context.push('/baby'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            _section(context, PhosphorIconsRegular.baby, s.babyGrowth, s.weekBabyGrowth(content.week)),
            _section(context, PhosphorIconsRegular.heart, s.motherChanges, s.weekMotherChanges(content.week)),
            _section(context, PhosphorIconsRegular.forkKnife, s.nutrition, s.weekNutrition(content.week)),
            _section(context, PhosphorIconsRegular.personSimpleWalk, s.exercise, s.weekExercise(content.week)),
            _section(context, PhosphorIconsRegular.warning, s.warningSigns, s.weekWarningSigns(content.week),
                accent: AppColors.warning),
            _section(context, PhosphorIconsRegular.stethoscope, s.medicalTips, s.weekMedicalTips(content.week)),
            const SizedBox(height: AppSpacing.sm),
            SectionHeader(title: s.checklist),
            SoftCard(
              child: Column(
                children: [
                  for (final item in s.weekChecklist(content.week))
                    _ChecklistTile(
                      label: item,
                      checked: _checked.contains('${content.week}:$item'),
                      onToggle: () {
                        final key = '${content.week}:$item';
                        setState(() {
                          if (_checked.contains(key)) {
                            _checked.remove(key);
                          } else {
                            _checked.add(key);
                          }
                        });
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int get _selectorCount => switch (_mode) {
        _JourneyMode.weeks => 40,
        _JourneyMode.months => 9,
        _JourneyMode.trimesters => 3,
      };

  String _labelFor(int value) => switch (_mode) {
        _JourneyMode.weeks => '$value',
        _JourneyMode.months => 'M$value',
        _JourneyMode.trimesters => 'T$value',
      };

  bool _isSelected(int value, int week) => switch (_mode) {
        _JourneyMode.weeks => value == week,
        _JourneyMode.months => ((week - 1) / 4.5).floor().clamp(0, 8) + 1 == value,
        _JourneyMode.trimesters => _trimesterOf(week) == value,
      };

  int _weekForIndex(int value) => switch (_mode) {
        _JourneyMode.weeks => value,
        _JourneyMode.months => (((value - 1) * 4.5).round() + 1).clamp(1, 40),
        _JourneyMode.trimesters => switch (value) {
            1 => 6,
            2 => 20,
            _ => 32,
          },
      };

  int _trimesterOf(int week) {
    if (week <= 13) return 1;
    if (week <= 27) return 2;
    return 3;
  }

  Widget _section(
    BuildContext context,
    IconData icon,
    String title,
    String body, {
    Color accent = AppColors.primary,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: SoftCard(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(AppRadii.sm),
              ),
              child: Icon(icon, color: accent, size: 22),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: context.textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    body,
                    style: context.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChecklistTile extends StatelessWidget {
  const _ChecklistTile({
    required this.label,
    required this.checked,
    required this.onToggle,
  });

  final String label;
  final bool checked;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggle,
      borderRadius: BorderRadius.circular(AppRadii.sm),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: checked ? AppColors.primary : AppColors.chipPrimary,
                borderRadius: BorderRadius.circular(AppRadii.xs),
              ),
              child: checked
                  ? const Icon(Icons.check, size: 16, color: AppColors.textOnPrimary)
                  : null,
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                label,
                style: context.textTheme.bodyMedium?.copyWith(
                  decoration: checked ? TextDecoration.lineThrough : null,
                  color: checked ? AppColors.textSecondary : AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
