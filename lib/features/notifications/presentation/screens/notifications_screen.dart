import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/models/models.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final items = ref.watch(notificationsProvider);
    final grouped = _groupByDay(items, s);

    return GradientScaffold(
      appBar: AppBar(
        title: Text(s.notifications),
        leading: IconButton(
          icon: const DirectionalIcon(PhosphorIconsRegular.caretLeft),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          if (items.isNotEmpty) ...[
            IconButton(
              tooltip: s.markAllRead,
              icon: const Icon(PhosphorIconsRegular.checks),
              onPressed: () {
                ref.read(notificationsProvider.notifier).markAllRead();
                context.showSnack(s.allMarkedRead);
              },
            ),
            IconButton(
              tooltip: s.clearAll,
              icon: const Icon(PhosphorIconsRegular.trash),
              onPressed: () async {
                final ok = await context.confirmDelete(
                  title: s.clearAll,
                  message: s.clearAllMessage,
                  cancelLabel: s.cancel,
                  deleteLabel: s.delete,
                );
                if (!ok) return;
                ref.read(notificationsProvider.notifier).clearAll();
                if (context.mounted) context.showSnack(s.notificationsCleared);
              },
            ),
          ],
        ],
      ),
      body: items.isEmpty
          ? EmptyState(
              icon: PhosphorIconsRegular.bellSlash,
              title: s.allCaughtUp,
              subtitle: s.noNotifications,
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.page,
                AppSpacing.sm,
                AppSpacing.page,
                AppSpacing.navClearance,
              ),
              children: [
                for (final section in grouped) ...[
                  SectionHeader(title: section.label),
                  const SizedBox(height: AppSpacing.xs),
                  ...section.items.map(
                    (n) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: _NotificationTile(notification: n),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                ],
              ],
            ),
    );
  }

  List<_NotifSection> _groupByDay(List<AppNotification> items, AppStrings s) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    final todayList = <AppNotification>[];
    final yesterdayList = <AppNotification>[];
    final earlierList = <AppNotification>[];

    final sorted = [...items]..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    for (final n in sorted) {
      final day = DateTime(n.createdAt.year, n.createdAt.month, n.createdAt.day);
      if (day == today) {
        todayList.add(n);
      } else if (day == yesterday) {
        yesterdayList.add(n);
      } else {
        earlierList.add(n);
      }
    }

    return [
      if (todayList.isNotEmpty) _NotifSection(s.today, todayList),
      if (yesterdayList.isNotEmpty) _NotifSection(s.yesterday, yesterdayList),
      if (earlierList.isNotEmpty) _NotifSection(s.earlier, earlierList),
    ];
  }
}

class _NotifSection {
  const _NotifSection(this.label, this.items);
  final String label;
  final List<AppNotification> items;
}

class _NotificationTile extends ConsumerWidget {
  const _NotificationTile({required this.notification});

  final AppNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final n = notification;
    final theme = context.textTheme;
    final style = _styleFor(n.type);

    return Dismissible(
      key: ValueKey(n.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: AlignmentDirectional.centerEnd,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.dangerSoft,
          borderRadius: BorderRadius.circular(AppRadii.xl),
        ),
        child: const Icon(PhosphorIconsRegular.trash, color: AppColors.danger),
      ),
      onDismissed: (_) {
        ref.read(notificationsProvider.notifier).delete(n.id);
        context.showSnack(s.notificationDeleted);
      },
      child: SoftCard(
        color: n.read ? AppColors.surface : AppColors.primarySoft.withValues(alpha: 0.55),
        onTap: () {
          if (!n.read) {
            ref.read(notificationsProvider.notifier).markRead(n.id);
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: style.bg,
                borderRadius: BorderRadius.circular(AppRadii.md),
              ),
              child: Icon(style.icon, color: style.fg, size: 24),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          s.notificationTitle(n.title),
                          style: theme.titleMedium?.copyWith(
                            fontWeight: n.read ? FontWeight.w600 : FontWeight.w800,
                          ),
                        ),
                      ),
                      if (!n.read)
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    s.notificationBody(n.body),
                    style: theme.bodySmall?.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    s.formatTime(n.createdAt),
                    style: theme.labelSmall?.copyWith(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            IconButton(
              tooltip: s.delete,
              icon: const Icon(PhosphorIconsRegular.trash, color: AppColors.danger, size: 20),
              onPressed: () async {
                final ok = await context.confirmDelete(
                  title: s.deleteNotification,
                  cancelLabel: s.cancel,
                  deleteLabel: s.delete,
                );
                if (!ok) return;
                ref.read(notificationsProvider.notifier).delete(n.id);
                if (context.mounted) context.showSnack(s.notificationDeleted);
              },
            ),
          ],
        ),
      ),
    );
  }

  static ({IconData icon, Color bg, Color fg}) _styleFor(NotificationType type) {
    switch (type) {
      case NotificationType.medication:
        return (
          icon: PhosphorIconsRegular.pill,
          bg: AppColors.chipLavender,
          fg: AppColors.primaryDeep,
        );
      case NotificationType.appointment:
        return (
          icon: PhosphorIconsRegular.calendarBlank,
          bg: AppColors.chipAccent,
          fg: AppColors.accent,
        );
      case NotificationType.weekly:
        return (
          icon: PhosphorIconsRegular.baby,
          bg: AppColors.chipPrimary,
          fg: AppColors.primary,
        );
      case NotificationType.water:
        return (
          icon: PhosphorIconsRegular.drop,
          bg: AppColors.chipTeal,
          fg: AppColors.success,
        );
      case NotificationType.weight:
        return (
          icon: PhosphorIconsRegular.scales,
          bg: AppColors.warningSoft,
          fg: AppColors.warning,
        );
      case NotificationType.kicks:
        return (
          icon: PhosphorIconsRegular.heartbeat,
          bg: AppColors.accentSoft,
          fg: AppColors.accent,
        );
      case NotificationType.community:
        return (
          icon: PhosphorIconsRegular.chatsCircle,
          bg: AppColors.chipPrimary,
          fg: AppColors.primary,
        );
      case NotificationType.system:
        return (
          icon: PhosphorIconsRegular.bell,
          bg: AppColors.primarySoft,
          fg: AppColors.primaryDeep,
        );
    }
  }
}
