import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key, required this.roomId});

  final String roomId;

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _ctrl = TextEditingController();
  final _scroll = ScrollController();

  @override
  void dispose() {
    _ctrl.dispose();
    _scroll.dispose();
    super.dispose();
  }

  void _send() {
    final text = _ctrl.text;
    if (text.trim().isEmpty) return;
    ref.read(chatMessagesProvider(widget.roomId).notifier).send(text);
    _ctrl.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scroll.hasClients) return;
      _scroll.animateTo(
        _scroll.position.maxScrollExtent,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(stringsProvider);
    final rooms = ref.watch(chatRoomsProvider);
    final room = rooms.where((r) => r.id == widget.roomId).firstOrNull;
    final messages = ref.watch(chatMessagesProvider(widget.roomId));
    final gentle = room?.gentle ?? false;
    final theme = context.textTheme;

    final title = room == null
        ? s.chats
        : s.roomName(ar: room.nameAr, fr: room.nameFr, en: room.nameEn);

    final bubbleMe = gentle ? AppColors.secondary : AppColors.primary;
    final bubbleOther = gentle ? const Color(0xFFF0E8FF) : AppColors.surface;
    final scaffoldTint = gentle ? AppColors.secondarySoft : null;

    return Container(
      color: scaffoldTint,
      child: GradientScaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              if (gentle)
                Text(
                  s.anonymousSafe,
                  style: theme.labelSmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
            ],
          ),
          leading: IconButton(
            icon: const DirectionalIcon(PhosphorIconsRegular.caretLeft),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scroll,
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.page,
                  AppSpacing.sm,
                  AppSpacing.page,
                  AppSpacing.md,
                ),
                itemCount: messages.length,
                itemBuilder: (_, i) {
                  final m = messages[i];
                  final align = m.isMe
                      ? AlignmentDirectional.centerEnd
                      : AlignmentDirectional.centerStart;
                  final bg = m.isMe ? bubbleMe : bubbleOther;
                  final fg = m.isMe
                      ? AppColors.textOnPrimary
                      : AppColors.textPrimary;

                  return Align(
                    alignment: align,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width * 0.78,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.sm,
                      ),
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: const Radius.circular(AppRadii.lg),
                          topEnd: const Radius.circular(AppRadii.lg),
                          bottomStart: Radius.circular(
                            m.isMe ? AppRadii.lg : AppRadii.xs,
                          ),
                          bottomEnd: Radius.circular(
                            m.isMe ? AppRadii.xs : AppRadii.lg,
                          ),
                        ),
                        boxShadow: AppShadows.softSm,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!m.isMe)
                            Text(
                              m.author,
                              style: theme.labelSmall?.copyWith(
                                color: AppColors.primaryDeep,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          Text(
                            m.text,
                            style: theme.bodyMedium?.copyWith(color: fg),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            m.time,
                            style: theme.labelSmall?.copyWith(
                              color: m.isMe
                                  ? AppColors.textOnPrimary
                                      .withValues(alpha: 0.75)
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SoftCard(
              margin: const EdgeInsets.fromLTRB(
                AppSpacing.page,
                0,
                AppSpacing.page,
                AppSpacing.md,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              color: gentle ? AppColors.surfaceGlass : AppColors.surface,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _ctrl,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _send(),
                      decoration: InputDecoration(
                        hintText: s.typeMessage,
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _send,
                    icon: Icon(
                      PhosphorIconsFill.paperPlaneTilt,
                      color: gentle ? AppColors.secondary : AppColors.primary,
                    ),
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
