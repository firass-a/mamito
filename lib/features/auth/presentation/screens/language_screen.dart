import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  static const _options = <({String code, String label, IconData icon})>[
    (code: 'ar', label: 'العربية', icon: PhosphorIconsFill.globeHemisphereEast),
    (code: 'fr', label: 'Français', icon: PhosphorIconsFill.globeHemisphereWest),
    (code: 'en', label: 'English', icon: PhosphorIconsFill.globe),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final locale = ref.watch(localeCodeProvider);
    final theme = Theme.of(context).textTheme;

    return GradientScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.page,
            AppSpacing.lg,
            AppSpacing.page,
            AppSpacing.xl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.lg),
              const Center(child: MamytoMark(size: 96, glow: true)),
              const SizedBox(height: AppSpacing.lg),
              Text(
                s.chooseLanguage,
                textAlign: TextAlign.center,
                style: theme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              ..._options.map((opt) {
                final selected = locale == opt.code;
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: SoftCard(
                    color: selected ? AppColors.primarySoft : AppColors.surface,
                    onTap: () =>
                        ref.read(localeCodeProvider.notifier).state = opt.code,
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: selected
                                ? AppColors.primary.withValues(alpha: 0.18)
                                : AppColors.secondarySoft,
                            borderRadius: BorderRadius.circular(AppRadii.md),
                          ),
                          child: Icon(
                            opt.icon,
                            color: AppColors.primaryDeep,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Text(
                            opt.label,
                            style: theme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: selected
                                  ? AppColors.primaryDeep
                                  : AppColors.textPrimary,
                            ),
                          ),
                        ),
                        if (selected)
                          const Icon(
                            PhosphorIconsFill.checkCircle,
                            color: AppColors.primary,
                            size: 26,
                          ),
                      ],
                    ),
                  ),
                );
              }),
              const Spacer(),
              PrimaryButton(
                label: s.continueBtn,
                icon: PhosphorIconsBold.arrowRight,
                onPressed: () => context.go('/onboarding'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
