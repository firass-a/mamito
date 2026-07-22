import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';

class OrderThanksScreen extends ConsumerWidget {
  const OrderThanksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final theme = context.textTheme;

    return GradientScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.page),
          child: Column(
            children: [
              const Spacer(),
              SoftCard(
                gradient: AppColors.gradientCard,
                padding: const EdgeInsets.all(AppSpacing.xxxl),
                child: Column(
                  children: [
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        color: AppColors.successSoft,
                        shape: BoxShape.circle,
                        boxShadow: AppShadows.softSm,
                      ),
                      child: const Icon(
                        PhosphorIconsFill.checkCircle,
                        size: 44,
                        color: AppColors.success,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      s.thankYou,
                      textAlign: TextAlign.center,
                      style: theme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      s.orderPlaced,
                      textAlign: TextAlign.center,
                      style: theme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              PrimaryButton(
                label: s.continueShopping,
                icon: PhosphorIconsBold.shoppingBag,
                onPressed: () => context.go('/store'),
              ),
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
