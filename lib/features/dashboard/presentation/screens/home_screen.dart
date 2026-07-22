import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/constants/app_constants.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final profile = ref.watch(profileProvider);
    final baby = ref.watch(babyProvider);
    final unread = ref.watch(unreadNotificationsProvider);
    final upcoming = ref.watch(upcomingAppointmentsProvider);
    final meds = ref.watch(medicationsProvider);
    final hydration = ref.watch(hydrationProvider);
    final posts = ref.watch(communityProvider);
    final weeks = ref.watch(weekContentsProvider);
    final theme = Theme.of(context).textTheme;

    final week = profile.currentWeek;
    final remaining = (AppConstants.pregnancyWeeks - week).clamp(0, 40);
    final tip = weeks.firstWhere((w) => w.week == week, orElse: () => weeks.first);
    final todayMed = meds.where((m) => !m.takenToday).followedBy(meds).firstOrNull;
    final nextAppt = upcoming.firstOrNull;
    final recentPost = posts.firstOrNull;

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
            _HomeHeader(
              greeting: s.greeting(profile.firstName),
              subtitle: s.pregnancyMonitor,
              unread: unread,
              onBell: () => context.push('/notifications'),
            ),
            const SizedBox(height: AppSpacing.lg),
            SoftCard(
              heroTag: 'week_hero',
              onTap: () => context.go('/journey'),
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 16),
              child: Column(
                children: [
                  Text(
                    s.weekSummary,
                    style: theme.titleMedium?.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 8),
                  WeekWheel(
                    currentWeek: week,
                    size: 260,
                    centerLabel: s.weeksPregnant(week),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    s.weekOf(week, AppConstants.pregnancyWeeks),
                    style: theme.titleLarge?.copyWith(
                      color: AppColors.primaryDeep,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    s.babySizeOf(s.fruitLabel(baby.fruitComparison)),
                    textAlign: TextAlign.center,
                    style: theme.bodyMedium?.copyWith(color: AppColors.textSecondary),
                  ),
                  if (baby.name.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      baby.name,
                      style: theme.titleMedium?.copyWith(
                        color: AppColors.primaryDeep,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.chipPrimary,
                      borderRadius: BorderRadius.circular(AppRadii.pill),
                    ),
                    child: Text(
                      s.weeksLeft(remaining),
                      style: theme.labelMedium?.copyWith(
                        color: AppColors.primaryDeep,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(s.quickActions, style: theme.titleLarge),
            const SizedBox(height: AppSpacing.sm),
            _QuickActionsRow(s: s),
            const SizedBox(height: AppSpacing.xl),
            Text(s.todayGlance, style: theme.titleLarge),
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                children: [
                  if (nextAppt != null)
                    _GlanceCard(
                      icon: PhosphorIconsRegular.calendarBlank,
                      color: AppColors.primary,
                      title: s.appointments,
                      body: s.appointmentTitle(nextAppt.title),
                      meta: '${s.formatWeekday(nextAppt.dateTime)} · ${s.formatTime(nextAppt.dateTime)}',
                      onTap: () => context.push('/appointments'),
                    ),
                  if (todayMed != null)
                    _GlanceCard(
                      icon: PhosphorIconsRegular.pill,
                      color: AppColors.accent,
                      title: s.medsShort,
                      body: s.medicationName(todayMed.name),
                      meta: s.medicationSchedule(todayMed.schedule),
                      onTap: () => context.push('/medications'),
                    ),
                  _GlanceCard(
                    icon: PhosphorIconsRegular.drop,
                    color: AppColors.success,
                    title: s.hydration,
                    body: '${hydration.glasses} / ${hydration.goal}',
                    meta: '',
                    onTap: () => context.push('/hydration'),
                  ),
                  if (recentPost != null)
                    _GlanceCard(
                      icon: PhosphorIconsRegular.chatCircleDots,
                      color: AppColors.secondary,
                      title: s.community,
                      body: s.communityPostContent(recentPost.id, recentPost.content),
                      meta: recentPost.author,
                      onTap: () => context.go('/community'),
                    ),
                  _GlanceCard(
                    icon: PhosphorIconsRegular.bag,
                    color: AppColors.primaryDeep,
                    title: s.navStore,
                    body: s.storeTitle,
                    meta: '',
                    onTap: () => context.go('/store'),
                  ),
                  _GlanceCard(
                    icon: PhosphorIconsRegular.lightbulb,
                    color: AppColors.warning,
                    title: s.fruitLabel(tip.fruitComparison),
                    body: s.weekNutrition(tip.week),
                    meta: s.weekOf(week, 40),
                    onTap: () => context.go('/journey'),
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

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({
    required this.greeting,
    required this.subtitle,
    required this.unread,
    required this.onBell,
  });
  final String greeting;
  final String subtitle;
  final int unread;
  final VoidCallback onBell;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(greeting, style: theme.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
              Text(subtitle, style: theme.bodyMedium?.copyWith(color: AppColors.textSecondary)),
            ],
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onBell,
            borderRadius: BorderRadius.circular(AppRadii.md),
            child: Ink(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadii.md),
                boxShadow: AppShadows.softSm,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(PhosphorIconsRegular.bell, color: AppColors.primaryDeep),
                  if (unread > 0)
                    PositionedDirectional(
                      top: 10,
                      end: 10,
                      child: Container(
                        constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(AppRadii.pill),
                        ),
                        child: Text(
                          unread > 9 ? '9+' : '$unread',
                          textAlign: TextAlign.center,
                          style: theme.labelSmall?.copyWith(
                            color: AppColors.textOnPrimary,
                            fontWeight: FontWeight.w800,
                            fontSize: 9,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _QuickActionsRow extends StatelessWidget {
  const _QuickActionsRow({required this.s});
  final AppStrings s;

  @override
  Widget build(BuildContext context) {
    final actions = <({String label, IconData icon, String route, Color tint})>[
      (label: s.appointments, icon: PhosphorIconsRegular.calendarBlank, route: '/appointments', tint: AppColors.chipPrimary),
      (label: s.symptoms, icon: PhosphorIconsRegular.heartbeat, route: '/symptoms', tint: AppColors.chipAccent),
      (label: s.mood, icon: PhosphorIconsRegular.smiley, route: '/mood', tint: AppColors.chipLavender),
      (label: s.articles, icon: PhosphorIconsRegular.bookOpenText, route: '/resources', tint: AppColors.chipTeal),
      (label: s.chats, icon: PhosphorIconsRegular.chatsTeardrop, route: '/chats', tint: AppColors.chipLavender),
      (label: s.navStore, icon: PhosphorIconsRegular.bag, route: '/store', tint: AppColors.chipPrimary),
      (label: s.hydration, icon: PhosphorIconsRegular.drop, route: '/hydration', tint: AppColors.chipTeal),
      (label: s.weight, icon: PhosphorIconsRegular.scales, route: '/weight', tint: AppColors.chipAccent),
    ];

    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: actions.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.sm),
        itemBuilder: (context, i) {
          final a = actions[i];
          return InkWell(
            onTap: () {
              if (a.route == '/store') {
                context.go(a.route);
              } else {
                context.push(a.route);
              }
            },
            borderRadius: BorderRadius.circular(AppRadii.lg),
            child: SizedBox(
              width: 78,
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: a.tint,
                      borderRadius: BorderRadius.circular(AppRadii.md),
                      boxShadow: AppShadows.softSm,
                    ),
                    child: Icon(a.icon, color: AppColors.primaryDeep, size: 26),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    a.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textSecondary,
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _GlanceCard extends StatelessWidget {
  const _GlanceCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.body,
    required this.meta,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String body;
  final String meta;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: AppSpacing.sm),
      child: SizedBox(
        width: 168,
        height: 160,
        child: SoftCard(
          onTap: onTap,
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(AppRadii.sm),
                ),
                child: Icon(icon, size: 18, color: color),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.labelSmall?.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              if (meta.isNotEmpty)
                Text(
                  meta,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.labelSmall?.copyWith(color: color, fontSize: 10),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
