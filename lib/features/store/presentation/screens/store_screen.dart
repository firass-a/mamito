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

class StoreScreen extends ConsumerWidget {
  const StoreScreen({super.key});

  static IconData productIcon(StoreProduct product) {
    switch (product.category) {
      case 'mom':
        return PhosphorIconsFill.heart;
      case 'baby':
        return PhosphorIconsFill.baby;
      default:
        return PhosphorIconsFill.bag;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final products = ref.watch(storeProductsProvider);
    final cart = ref.watch(cartProvider);
    final cartQty = cart.fold<int>(0, (sum, e) => sum + e.qty);
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
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      s.storeTitle,
                      style: theme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      IconButton(
                        onPressed: () => context.push('/cart'),
                        icon: const Icon(
                          PhosphorIconsRegular.shoppingCart,
                          color: AppColors.primaryDeep,
                        ),
                      ),
                      if (cartQty > 0)
                        Positioned(
                          right: 6,
                          top: 6,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            constraints: const BoxConstraints(
                              minWidth: 18,
                              minHeight: 18,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.accent,
                              borderRadius: BorderRadius.circular(AppRadii.pill),
                            ),
                            child: Center(
                              child: Text(
                                '$cartQty',
                                style: theme.labelSmall?.copyWith(
                                  color: AppColors.textOnPrimary,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.page,
                  AppSpacing.xs,
                  AppSpacing.page,
                  AppSpacing.navClearance,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: AppSpacing.md,
                  crossAxisSpacing: AppSpacing.md,
                  childAspectRatio: 0.78,
                ),
                itemCount: products.length,
                itemBuilder: (_, i) {
                  final p = products[i];
                  final color = Color(p.colorValue);
                  final name = s.productName(
                    ar: p.nameAr,
                    fr: p.nameFr,
                    en: p.nameEn,
                  );
                  return SoftCard(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    onTap: () => context.push('/product/${p.id}'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(AppRadii.lg),
                            ),
                            child: Icon(
                              productIcon(p),
                              size: 40,
                              color: AppColors.primaryDeep,
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xxs),
                        Text(
                          '${p.price.toStringAsFixed(0)} د.ج',
                          style: theme.labelLarge?.copyWith(
                            color: AppColors.primaryDeep,
                            fontWeight: FontWeight.w800,
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
