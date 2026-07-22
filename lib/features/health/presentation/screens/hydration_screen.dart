import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

class HydrationScreen extends ConsumerWidget {
  const HydrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final day = ref.watch(hydrationProvider);
    final progress = day.goal == 0 ? 0.0 : day.glasses / day.goal;
    final theme = context.textTheme;
    final notifier = ref.read(hydrationProvider.notifier);

    return GradientScaffold(
      appBar: AppBar(
        title: Text(s.hydration),
        leading: IconButton(
          icon: const DirectionalIcon(PhosphorIconsRegular.caretLeft),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.sm,
          AppSpacing.page,
          AppSpacing.xxxl,
        ),
        children: [
          SoftCard(
            gradient: AppColors.gradientCard,
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.xxxl,
              horizontal: AppSpacing.xl,
            ),
            child: Column(
              children: [
                Text(
                  s.today,
                  style: theme.titleMedium?.copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: AppSpacing.xl),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: CircularProgressIndicator(
                          value: progress.clamp(0.0, 1.0),
                          strokeWidth: 14,
                          backgroundColor: AppColors.primarySoft,
                          color: AppColors.primary,
                          strokeCap: StrokeCap.round,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            PhosphorIconsRegular.drop,
                            size: 36,
                            color: AppColors.primary,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            '${day.glasses}',
                            style: theme.displaySmall?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          Text(
                            s.ofGoalGlasses(day.goal),
                            style: theme.bodyMedium?.copyWith(color: AppColors.textSecondary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xxl),
                Text(
                  progress >= 1
                      ? s.goalReached
                      : s.moreToGo((day.goal - day.glasses).clamp(0, day.goal)),
                  style: theme.titleMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Row(
            children: [
              Expanded(
                child: _RoundAction(
                  icon: PhosphorIconsRegular.minus,
                  label: s.remove,
                  onTap: () {
                    notifier.removeGlass();
                    context.showSnack(s.glassRemoved);
                  },
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _RoundAction(
                  icon: PhosphorIconsRegular.plus,
                  label: s.addGlass,
                  primary: true,
                  onTap: () {
                    notifier.addGlass();
                    context.showSnack(s.glassAdded);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          ProgressCard(
            title: s.dailyGoal,
            subtitle: s.glassesProgress(day.glasses, day.goal),
            progress: progress,
          ),
          const SizedBox(height: AppSpacing.md),
          SoftCard(
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.chipTeal,
                    borderRadius: BorderRadius.circular(AppRadii.md),
                  ),
                  child: const Icon(PhosphorIconsRegular.lightbulb, color: AppColors.success),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(
                    s.hydrationTip,
                    style: theme.bodyMedium?.copyWith(color: AppColors.textSecondary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RoundAction extends StatelessWidget {
  const _RoundAction({
    required this.icon,
    required this.label,
    required this.onTap,
    this.primary = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      onTap: onTap,
      color: primary ? AppColors.primary : AppColors.surface,
      child: Column(
        children: [
          Icon(
            icon,
            size: 28,
            color: primary ? AppColors.textOnPrimary : AppColors.primary,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            label,
            style: context.textTheme.titleMedium?.copyWith(
              color: primary ? AppColors.textOnPrimary : AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
