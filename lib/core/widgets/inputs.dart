import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../theme/app_colors.dart';

class RoundedSearchBar extends StatelessWidget {
  const RoundedSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    this.hint = 'Search…',
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        boxShadow: AppShadows.softSm,
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
          prefixIcon: Icon(
            PhosphorIconsRegular.magnifyingGlass,
            color: AppColors.textSecondary,
            size: 22,
          ),
          // Align search affordance to the start edge in RTL/LTR.
          prefixIconConstraints: const BoxConstraints(minWidth: 48, minHeight: 48),
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadii.xl),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadii.xl),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadii.xl),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.4),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.md,
          ),
        ),
      ),
    );
  }
}

class SoftChip extends StatelessWidget {
  const SoftChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.pill),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : AppColors.chipPrimary,
            borderRadius: BorderRadius.circular(AppRadii.pill),
            boxShadow: selected ? AppShadows.softSm : null,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: selected ? AppColors.textOnPrimary : AppColors.primaryDeep,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
