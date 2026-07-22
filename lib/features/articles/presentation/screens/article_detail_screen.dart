import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

class ArticleDetailScreen extends ConsumerWidget {
  const ArticleDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final articles = ref.watch(articlesProvider);
    final article = articles.where((a) => a.id == id).firstOrNull;

    if (article == null) {
      return GradientScaffold(
        appBar: AppBar(
          title: Text(s.article),
          leading: IconButton(
            icon: const DirectionalIcon(PhosphorIconsRegular.caretLeft),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
        ),
        body: EmptyState(
          icon: PhosphorIconsRegular.bookOpenText,
          title: s.articleNotFound,
          subtitle: s.articleNotFoundHint,
        ),
      );
    }

    final n = ref.read(articlesProvider.notifier);

    return GradientScaffold(
      appBar: AppBar(
        title: Text(s.articleCategoryLabel(article.category)),
        leading: IconButton(
          icon: const DirectionalIcon(PhosphorIconsRegular.caretLeft),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          IconButton(
            onPressed: () => n.toggleLike(article.id),
            icon: Icon(
              article.liked ? PhosphorIconsFill.heart : PhosphorIconsRegular.heart,
              color: article.liked ? AppColors.accent : AppColors.textSecondary,
            ),
          ),
          IconButton(
            onPressed: () => n.toggleBookmark(article.id),
            icon: Icon(
              article.bookmarked
                  ? PhosphorIconsFill.bookmarkSimple
                  : PhosphorIconsRegular.bookmarkSimple,
              color: article.bookmarked ? AppColors.primary : AppColors.textSecondary,
            ),
          ),
        ],
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s.articleTitleKey(article.title),
                  style: context.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  s.byAuthor(article.author),
                  style: context.textTheme.titleSmall?.copyWith(
                    color: AppColors.primaryDeep,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  '${s.reviewedByLabel(article.reviewedBy)} · ${s.formatDate(article.publishedAt)}',
                  style: context.textTheme.bodySmall
                      ?.copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Icon(
                      article.liked ? PhosphorIconsFill.heart : PhosphorIconsRegular.heart,
                      size: 18,
                      color: article.liked ? AppColors.accent : AppColors.textSecondary,
                    ),
                    const SizedBox(width: AppSpacing.xxs),
                    Text(s.likesCount(article.likes), style: context.textTheme.labelLarge),
                    const Spacer(),
                    SoftChip(
                      label: s.articleCategoryLabel(article.category),
                      selected: true,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          SoftCard(
            child: Text(
              s.articleBody(
                article.category,
                int.tryParse(
                      RegExp(r'\((\d+)\)\s*$').firstMatch(article.title)?.group(1) ?? '',
                    ) ??
                    1,
              ),
              textAlign: TextAlign.start,
              style: context.textTheme.bodyLarge?.copyWith(height: 1.55),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          SoftCard(
            child: Row(
              children: [
                Expanded(
                  child: SecondaryButton(
                    label: article.liked ? s.liked : s.like,
                    onPressed: () => n.toggleLike(article.id),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: PrimaryButton(
                    label: article.bookmarked ? s.saved : s.save,
                    onPressed: () => n.toggleBookmark(article.id),
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
