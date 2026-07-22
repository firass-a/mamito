import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/models/models.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

class CommunityScreen extends ConsumerStatefulWidget {
  const CommunityScreen({super.key});

  @override
  ConsumerState<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends ConsumerState<CommunityScreen> {
  String? _topic;
  final _expanded = <String>{};

  static const _topics = ['All', 'cravings', 'support', 'symptoms', 'nutrition', 'general'];

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(stringsProvider);
    final posts = ref.watch(communityProvider);
    final filtered = posts.where((p) {
      if (_topic == null || _topic == 'All') return true;
      return p.topic.toLowerCase() == _topic!.toLowerCase();
    }).toList()
      ..sort((a, b) {
        if (a.pinned != b.pinned) return a.pinned ? -1 : 1;
        return b.createdAt.compareTo(a.createdAt);
      });

    return GradientScaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => _showCreateSheet(context),
        child: const Icon(PhosphorIconsRegular.plus, color: AppColors.textOnPrimary),
      ),
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
                    s.community,
                    style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Expanded(
                        child: SoftChip(
                          label: s.feed,
                          selected: true,
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SoftChip(
                          label: s.chats,
                          selected: false,
                          onTap: () => context.push('/chats'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.page),
                scrollDirection: Axis.horizontal,
                itemCount: _topics.length,
                separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.xs),
                itemBuilder: (_, i) {
                  final t = _topics[i];
                  final selected = (_topic == null && t == 'All') || _topic == t;
                  return SoftChip(
                    label: s.topicLabel(t),
                    selected: selected,
                    onTap: () => setState(() => _topic = t == 'All' ? null : t),
                  );
                },
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Expanded(
              child: filtered.isEmpty
                  ? EmptyState(
                      icon: PhosphorIconsRegular.chatCircle,
                      title: s.emptyPosts,
                      subtitle: s.emptyPostsHint,
                      actionLabel: s.createPost,
                      onAction: () => _showCreateSheet(context),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(
                        AppSpacing.page,
                        AppSpacing.xs,
                        AppSpacing.page,
                        AppSpacing.navClearance,
                      ),
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
                      itemBuilder: (_, i) => _PostCard(
                        post: filtered[i],
                        expanded: _expanded.contains(filtered[i].id),
                        onToggleExpand: () => setState(() {
                          final id = filtered[i].id;
                          if (_expanded.contains(id)) {
                            _expanded.remove(id);
                          } else {
                            _expanded.add(id);
                          }
                        }),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showCreateSheet(BuildContext context) async {
    final s = ref.read(stringsProvider);
    final contentCtrl = TextEditingController();
    var topic = 'general';

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadii.xl)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setSheet) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.page,
                AppSpacing.lg,
                AppSpacing.page,
                MediaQuery.viewInsetsOf(ctx).bottom + AppSpacing.xl,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(s.newPost, style: ctx.textTheme.titleLarge),
                  const SizedBox(height: AppSpacing.md),
                  TextField(
                    controller: contentCtrl,
                    maxLines: 4,
                    decoration: InputDecoration(hintText: s.shareHint),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.xs,
                    runSpacing: AppSpacing.xs,
                    children: _topics.where((t) => t != 'All').map((t) {
                      return SoftChip(
                        label: s.topicLabel(t),
                        selected: topic == t,
                        onTap: () => setSheet(() => topic = t),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  PrimaryButton(
                    label: s.postBtn,
                    onPressed: () {
                      final text = contentCtrl.text.trim();
                      if (text.isEmpty) {
                        context.showSnack(s.writeSomethingFirst, error: true);
                        return;
                      }
                      ref.read(communityProvider.notifier).createPost(text, topic: topic);
                      Navigator.pop(ctx);
                      context.showSnack(s.postShared);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
    contentCtrl.dispose();
  }
}

class _PostCard extends ConsumerStatefulWidget {
  const _PostCard({
    required this.post,
    required this.expanded,
    required this.onToggleExpand,
  });

  final CommunityPost post;
  final bool expanded;
  final VoidCallback onToggleExpand;

  @override
  ConsumerState<_PostCard> createState() => _PostCardState();
}

class _PostCardState extends ConsumerState<_PostCard> {
  final _commentCtrl = TextEditingController();

  @override
  void dispose() {
    _commentCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(stringsProvider);
    final post = widget.post;
    final n = ref.read(communityProvider.notifier);

    return SoftCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primarySoft,
                child: Text(
                  post.author.initials,
                  style: const TextStyle(
                    color: AppColors.primaryDeep,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.author, style: context.textTheme.titleMedium),
                    Text(
                      '${s.formatDate(post.createdAt)} · ${s.topicLabel(post.topic)}',
                      style: context.textTheme.bodySmall
                          ?.copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
              if (post.pinned)
                const Icon(PhosphorIconsRegular.pushPin, size: 18, color: AppColors.primary),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            s.communityPostContent(post.id, post.content),
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () => n.toggleLike(post.id),
                icon: Icon(
                  post.likedByMe ? PhosphorIconsFill.heart : PhosphorIconsRegular.heart,
                  color: post.likedByMe ? AppColors.accent : AppColors.textSecondary,
                ),
              ),
              Text('${post.likes}', style: context.textTheme.labelLarge),
              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: widget.onToggleExpand,
                icon: Icon(
                  PhosphorIconsRegular.chatCircle,
                  color: AppColors.textSecondary,
                ),
              ),
              Text('${post.comments.length}', style: context.textTheme.labelLarge),
              const Spacer(),
              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () => n.toggleBookmark(post.id),
                icon: Icon(
                  post.bookmarked
                      ? PhosphorIconsFill.bookmarkSimple
                      : PhosphorIconsRegular.bookmarkSimple,
                  color: post.bookmarked ? AppColors.primary : AppColors.textSecondary,
                ),
              ),
            ],
          ),
          if (widget.expanded) ...[
            const Divider(height: AppSpacing.lg),
            ...post.comments.map((c) => _CommentRow(postId: post.id, comment: c)),
            const SizedBox(height: AppSpacing.xs),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentCtrl,
                    decoration: InputDecoration(hintText: s.addComment),
                    onSubmitted: (_) => _submit(n, post.id),
                  ),
                ),
                IconButton(
                  onPressed: () => _submit(n, post.id),
                  icon: const Icon(PhosphorIconsRegular.paperPlaneTilt, color: AppColors.primary),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  void _submit(CommunityNotifier n, String postId) {
    final text = _commentCtrl.text.trim();
    if (text.isEmpty) return;
    n.addComment(postId, text);
    _commentCtrl.clear();
  }
}

class _CommentRow extends ConsumerWidget {
  const _CommentRow({required this.postId, required this.comment});

  final String postId;
  final CommunityComment comment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: context.textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: '${comment.author} ',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(text: s.communityCommentText(comment.id, comment.text)),
                ],
              ),
            ),
          ),
          if (comment.isMine)
            IconButton(
              visualDensity: VisualDensity.compact,
              icon: const Icon(PhosphorIconsRegular.trash, size: 18, color: AppColors.danger),
              onPressed: () async {
                final ok = await context.confirmDelete(
                  title: s.deleteComment,
                  cancelLabel: s.cancel,
                  deleteLabel: s.delete,
                );
                if (!ok) return;
                ref.read(communityProvider.notifier).deleteComment(postId, comment.id);
              },
            ),
        ],
      ),
    );
  }
}
