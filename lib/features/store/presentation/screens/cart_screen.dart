import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/features/store/presentation/screens/store_screen.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final cart = ref.watch(cartProvider);
    final total =
        cart.fold<double>(0, (sum, e) => sum + e.product.price * e.qty);
    final theme = context.textTheme;

    return GradientScaffold(
      appBar: AppBar(
        title: Text(s.cart),
        leading: IconButton(
          icon: const DirectionalIcon(PhosphorIconsRegular.caretLeft),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: cart.isEmpty
          ? EmptyState(
              icon: PhosphorIconsRegular.shoppingCart,
              title: s.emptyCart,
              subtitle: s.continueShopping,
              actionLabel: s.continueShopping,
              onAction: () => context.go('/store'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.page,
                      AppSpacing.sm,
                      AppSpacing.page,
                      AppSpacing.md,
                    ),
                    itemCount: cart.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: AppSpacing.sm),
                    itemBuilder: (_, i) {
                      final item = cart[i];
                      final p = item.product;
                      final name = s.productName(
                        ar: p.nameAr,
                        fr: p.nameFr,
                        en: p.nameEn,
                      );
                      return SoftCard(
                        child: Row(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: Color(p.colorValue),
                                borderRadius:
                                    BorderRadius.circular(AppRadii.md),
                              ),
                              child: Icon(
                                StoreScreen.productIcon(p),
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
                                    style: theme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.xxs),
                                  Text(
                                    '${p.price.toStringAsFixed(0)} د.ج × ${item.qty}',
                                    style: theme.bodySmall?.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () => ref
                                  .read(cartProvider.notifier)
                                  .remove(p.id),
                              icon: const Icon(
                                PhosphorIconsRegular.trash,
                                color: AppColors.danger,
                              ),
                            ),
                          ],
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
                    AppSpacing.xl,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(s.total, style: theme.titleMedium),
                          const Spacer(),
                          Text(
                            '${total.toStringAsFixed(0)} د.ج',
                            style: theme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.primaryDeep,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.md),
                      PrimaryButton(
                        label: s.checkout,
                        icon: PhosphorIconsBold.creditCard,
                        onPressed: () => context.push('/checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
