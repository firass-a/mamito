import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/features/store/presentation/screens/store_screen.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final products = ref.watch(storeProductsProvider);
    final product = products.where((p) => p.id == productId).firstOrNull;
    final theme = context.textTheme;

    if (product == null) {
      return GradientScaffold(
        appBar: AppBar(
          title: Text(s.storeTitle),
          leading: IconButton(
            icon: const DirectionalIcon(PhosphorIconsRegular.caretLeft),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
        ),
        body: EmptyState(
          icon: PhosphorIconsRegular.bag,
          title: s.storeTitle,
          subtitle: '—',
        ),
      );
    }

    final name = s.productName(
      ar: product.nameAr,
      fr: product.nameFr,
      en: product.nameEn,
    );
    final color = Color(product.colorValue);

    return GradientScaffold(
      appBar: AppBar(
        title: Text(name),
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
          AppSpacing.xxxl,
        ),
        children: [
          SoftCard(
            padding: EdgeInsets.zero,
            child: Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(AppRadii.xl),
              ),
              child: Icon(
                StoreScreen.productIcon(product),
                size: 72,
                color: AppColors.primaryDeep,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            name,
            style: theme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            '${product.price.toStringAsFixed(0)} د.ج',
            style: theme.titleLarge?.copyWith(
              color: AppColors.primaryDeep,
              fontWeight: FontWeight.w800,
            ),
          ),
          if (product.descriptionEn.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            SoftCard(
              child: Text(
                s.productDescription(product.descriptionEn),
                style: theme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.xxl),
          PrimaryButton(
            label: s.addToCart,
            icon: PhosphorIconsBold.shoppingCart,
            onPressed: () {
              ref.read(cartProvider.notifier).add(product);
              context.showSnack(s.saved);
            },
          ),
        ],
      ),
    );
  }
}
