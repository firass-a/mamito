import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _cityCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _addressCtrl.dispose();
    _cityCtrl.dispose();
    super.dispose();
  }

  void _placeOrder() {
    ref.read(cartProvider.notifier).clear();
    context.go('/order-thanks');
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(stringsProvider);
    final cart = ref.watch(cartProvider);
    final total =
        cart.fold<double>(0, (sum, e) => sum + e.product.price * e.qty);
    final theme = context.textTheme;

    return GradientScaffold(
      appBar: AppBar(
        title: Text(s.checkout),
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
            child: Column(
              children: [
                _StubField(
                  controller: _nameCtrl,
                  hint: s.firstName,
                  icon: PhosphorIconsRegular.user,
                ),
                const SizedBox(height: AppSpacing.md),
                _StubField(
                  controller: _phoneCtrl,
                  hint: s.phone,
                  icon: PhosphorIconsRegular.phone,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: AppSpacing.md),
                _StubField(
                  controller: _addressCtrl,
                  hint: s.address,
                  icon: PhosphorIconsRegular.mapPin,
                ),
                const SizedBox(height: AppSpacing.md),
                _StubField(
                  controller: _cityCtrl,
                  hint: s.city,
                  icon: PhosphorIconsRegular.buildings,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          SoftCard(
            child: Row(
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
          ),
          const SizedBox(height: AppSpacing.xxl),
          PrimaryButton(
            label: s.placeOrder,
            icon: PhosphorIconsBold.check,
            onPressed: _placeOrder,
          ),
        ],
      ),
    );
  }
}

class _StubField extends StatelessWidget {
  const _StubField({
    required this.controller,
    required this.hint,
    required this.icon,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: AppColors.primary),
        filled: true,
        fillColor: AppColors.secondarySoft,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.md),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
