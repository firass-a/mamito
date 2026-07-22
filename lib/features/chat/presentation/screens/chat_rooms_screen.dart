import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

class ChatRoomsScreen extends ConsumerWidget {
  const ChatRoomsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final rooms = ref.watch(chatRoomsProvider);
    final theme = context.textTheme;

    return GradientScaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.page,
                AppSpacing.md,
                AppSpacing.page,
                AppSpacing.sm,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    s.chats,
                    style: theme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    s.anonymousSafe,
                    style: theme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.page,
                  AppSpacing.xs,
                  AppSpacing.page,
                  AppSpacing.navClearance,
                ),
                itemCount: rooms.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: AppSpacing.sm),
                itemBuilder: (_, i) {
                  final room = rooms[i];
                  final name = s.roomName(
                    ar: room.nameAr,
                    fr: room.nameFr,
                    en: room.nameEn,
                  );
                  return SoftCard(
                    color: room.gentle
                        ? AppColors.secondarySoft
                        : AppColors.surface,
                    onTap: () => context.push('/chat/${room.id}'),
                    child: Row(
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: room.gentle
                                ? AppColors.primaryMuted.withValues(alpha: 0.45)
                                : AppColors.primarySoft,
                            borderRadius: BorderRadius.circular(AppRadii.md),
                          ),
                          child: Icon(
                            room.gentle
                                ? PhosphorIconsFill.handsPraying
                                : PhosphorIconsFill.chatsCircle,
                            color: AppColors.primaryDeep,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: theme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.xxs),
                              Text(
                                '${room.memberCount} ${s.members} · ${s.relativeActivity(room.lastActivity)}',
                                style: theme.bodySmall?.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const DirectionalIcon(
                          PhosphorIconsRegular.caretRight,
                          color: AppColors.textSecondary,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
