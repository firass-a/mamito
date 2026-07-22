import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/constants/app_constants.dart';
import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

final pushNotifsProvider = StateProvider<bool>((ref) => true);
final medRemindersProvider = StateProvider<bool>((ref) => true);
final apptRemindersProvider = StateProvider<bool>((ref) => true);
final weeklyTipsProvider = StateProvider<bool>((ref) => true);
final waterRemindersProvider = StateProvider<bool>((ref) => false);

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeCodeProvider);
    final s = ref.watch(stringsProvider);
    final theme = context.textTheme;

    return GradientScaffold(
      appBar: AppBar(
        title: Text(s.settings),
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
          AppSpacing.navClearance,
        ),
        children: [
          SoftCard(
            gradient: AppColors.gradientHero,
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: AppColors.surface.withValues(alpha: 0.28),
                    borderRadius: BorderRadius.circular(AppRadii.md),
                  ),
                  child: Icon(
                    PhosphorIconsFill.crownSimple,
                    color: AppColors.textOnPrimary.withValues(alpha: 0.95),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.premium,
                        style: theme.titleMedium?.copyWith(
                          color: AppColors.textOnPrimary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        s.premiumUnlockBody,
                        style: theme.bodySmall?.copyWith(
                          color: AppColors.textOnPrimary.withValues(alpha: 0.88),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          SectionHeader(title: s.language),
          const SizedBox(height: AppSpacing.xs),
          SoftCard(
            child: Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                SoftChip(
                  label: 'العربية',
                  selected: locale == 'ar',
                  onTap: () => ref.read(localeCodeProvider.notifier).state = 'ar',
                ),
                SoftChip(
                  label: 'Français',
                  selected: locale == 'fr',
                  onTap: () => ref.read(localeCodeProvider.notifier).state = 'fr',
                ),
                SoftChip(
                  label: 'English',
                  selected: locale == 'en',
                  onTap: () => ref.read(localeCodeProvider.notifier).state = 'en',
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          SectionHeader(title: s.notifications),
          const SizedBox(height: AppSpacing.xs),
          SoftCard(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
            child: Column(
              children: [
                _ToggleRow(
                  icon: PhosphorIconsRegular.bellRinging,
                  title: s.pushNotifications,
                  value: ref.watch(pushNotifsProvider),
                  onChanged: (v) => ref.read(pushNotifsProvider.notifier).state = v,
                ),
                const Divider(height: 1, color: AppColors.divider),
                _ToggleRow(
                  icon: PhosphorIconsRegular.pill,
                  title: s.medReminders,
                  value: ref.watch(medRemindersProvider),
                  onChanged: (v) => ref.read(medRemindersProvider.notifier).state = v,
                ),
                const Divider(height: 1, color: AppColors.divider),
                _ToggleRow(
                  icon: PhosphorIconsRegular.calendarBlank,
                  title: s.apptReminders,
                  value: ref.watch(apptRemindersProvider),
                  onChanged: (v) => ref.read(apptRemindersProvider.notifier).state = v,
                ),
                const Divider(height: 1, color: AppColors.divider),
                _ToggleRow(
                  icon: PhosphorIconsRegular.lightbulb,
                  title: s.weeklyTips,
                  value: ref.watch(weeklyTipsProvider),
                  onChanged: (v) => ref.read(weeklyTipsProvider.notifier).state = v,
                ),
                const Divider(height: 1, color: AppColors.divider),
                _ToggleRow(
                  icon: PhosphorIconsRegular.drop,
                  title: s.hydrationNudges,
                  value: ref.watch(waterRemindersProvider),
                  onChanged: (v) => ref.read(waterRemindersProvider.notifier).state = v,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          SectionHeader(title: s.support),
          const SizedBox(height: AppSpacing.xs),
          SoftCard(
            onTap: () => _showHelp(context, s),
            child: Row(
              children: [
                _iconBox(PhosphorIconsRegular.question),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(s.helpFaq, style: theme.titleMedium),
                ),
                const DirectionalIcon(PhosphorIconsRegular.caretRight, color: AppColors.textSecondary),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          SoftCard(
            onTap: () => _showAbout(context, s),
            child: Row(
              children: [
                _iconBox(PhosphorIconsRegular.info),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(s.aboutMamito, style: theme.titleMedium),
                ),
                const DirectionalIcon(PhosphorIconsRegular.caretRight, color: AppColors.textSecondary),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconBox(IconData icon) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.primarySoft,
        borderRadius: BorderRadius.circular(AppRadii.md),
      ),
      child: Icon(icon, color: AppColors.primary),
    );
  }

  void _showHelp(BuildContext context, AppStrings s) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(s.helpFaq),
        content: Text(s.helpFaqBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(s.gotIt),
          ),
        ],
      ),
    );
  }

  void _showAbout(BuildContext context, AppStrings s) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(s.aboutTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const MamytoMark(size: 88, glow: true),
            const SizedBox(height: AppSpacing.md),
            Text(
              '${AppConstants.appName}\n${AppConstants.tagline}\n\n${s.aboutBody}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(s.close),
          ),
        ],
      ),
    );
  }
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xxs,
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 22),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(title, style: context.textTheme.titleSmall),
          ),
          Switch.adaptive(
            value: value,
            activeColor: AppColors.primary,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
