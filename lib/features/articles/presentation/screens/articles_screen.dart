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

enum _SortTab { recommended, trending, newest, bookmarks }

class ArticlesScreen extends ConsumerStatefulWidget {
  const ArticlesScreen({super.key});

  @override
  ConsumerState<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends ConsumerState<ArticlesScreen> {
  final _searchCtrl = TextEditingController();
  _SortTab _tab = _SortTab.recommended;

  static const _categories = [
    'All',
    'Nutrition',
    'Exercise',
    'Mental Health',
    'Baby Development',
    'Delivery',
    'Breastfeeding',
  ];

  String _categoryLabel(AppStrings s, String c) => switch (c) {
        'All' => s.all,
        'Nutrition' => s.nutrition,
        'Exercise' => s.exercise,
        'Mental Health' => s.mentalHealth,
        'Baby Development' => s.babyDevelopment,
        'Delivery' => s.delivery,
        'Breastfeeding' => s.breastfeeding,
        _ => c,
      };

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  List<Article> _applyTab(List<Article> list) {
    switch (_tab) {
      case _SortTab.recommended:
        return list;
      case _SortTab.trending:
        return list.where((a) => a.trending).toList();
      case _SortTab.newest:
        return [...list]..sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
      case _SortTab.bookmarks:
        return list.where((a) => a.bookmarked).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(stringsProvider);
    final filter = ref.watch(articleFilterProvider);
    final articles = _applyTab(ref.watch(filteredArticlesProvider));

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
                    s.navResources,
                    style: context.textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  RoundedSearchBar(
                    controller: _searchCtrl,
                    hint: s.searchArticles,
                    onChanged: (q) =>
                        ref.read(articleQueryProvider.notifier).state = q,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.page),
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.xs),
                itemBuilder: (_, i) {
                  final c = _categories[i];
                  return SoftChip(
                    label: _categoryLabel(s, c),
                    selected: filter == c,
                    onTap: () => ref.read(articleFilterProvider.notifier).state = c,
                  );
                },
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.page),
                children: [
                  for (final t in _SortTab.values) ...[
                    SoftChip(
                      label: switch (t) {
                        _SortTab.recommended => s.recommended,
                        _SortTab.trending => s.trending,
                        _SortTab.newest => s.newest,
                        _SortTab.bookmarks => s.bookmarks,
                      },
                      selected: _tab == t,
                      onTap: () => setState(() => _tab = t),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                  ],
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Expanded(
              child: articles.isEmpty
                  ? EmptyState(
                      icon: PhosphorIconsRegular.bookOpenText,
                      title: s.noArticles,
                      subtitle: s.noArticlesHint,
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(
                        AppSpacing.page,
                        AppSpacing.xs,
                        AppSpacing.page,
                        AppSpacing.navClearance,
                      ),
                      itemCount: articles.length,
                      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
                      itemBuilder: (_, i) {
                        final a = articles[i];
                        return SoftCard(
                          onTap: () => context.push('/article/${a.id}'),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: AppColors.primarySoft,
                                  borderRadius: BorderRadius.circular(AppRadii.md),
                                ),
                                child: const Icon(
                                  PhosphorIconsRegular.article,
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(width: AppSpacing.md),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(s.articleTitleKey(a.title), style: context.textTheme.titleMedium),
                                    const SizedBox(height: AppSpacing.xxs),
                                    Text(
                                      s.articleSummary(a.category, a.summary),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textTheme.bodySmall
                                          ?.copyWith(color: AppColors.textSecondary),
                                    ),
                                    const SizedBox(height: AppSpacing.xs),
                                    Text(
                                      '${s.articleCategoryLabel(a.category)} · ${s.formatDate(a.publishedAt)}',
                                      style: context.textTheme.labelMedium?.copyWith(
                                        color: AppColors.primaryDeep,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () => ref
                                    .read(articlesProvider.notifier)
                                    .toggleBookmark(a.id),
                                icon: Icon(
                                  a.bookmarked
                                      ? PhosphorIconsFill.bookmarkSimple
                                      : PhosphorIconsRegular.bookmarkSimple,
                                  color: a.bookmarked
                                      ? AppColors.primary
                                      : AppColors.textSecondary,
                                ),
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
