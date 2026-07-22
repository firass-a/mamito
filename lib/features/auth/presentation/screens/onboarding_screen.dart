import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  int _index = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goAuth() => context.go('/auth');

  void _next() {
    if (_index >= 2) {
      _goAuth();
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 380),
      curve: Curves.easeOutCubic,
    );
  }

  List<_OnboardPage> _pagesFor(AppStrings s) => [
        _OnboardPage(
          icon: PhosphorIconsFill.heart,
          title: s.onboarding1Title,
          subtitle: s.onboarding1Body,
          accent: AppColors.primarySoft,
          useBrandMark: true,
        ),
        _OnboardPage(
          icon: PhosphorIconsFill.baby,
          title: s.onboarding2Title,
          subtitle: s.onboarding2Body,
          accent: AppColors.accentSoft,
        ),
        _OnboardPage(
          icon: PhosphorIconsFill.handsPraying,
          title: s.onboarding3Title,
          subtitle: s.onboarding3Body,
          accent: AppColors.successSoft,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(stringsProvider);
    final pages = _pagesFor(s);
    final isLast = _index >= pages.length - 1;

    return GradientScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.page,
            AppSpacing.md,
            AppSpacing.page,
            AppSpacing.xl,
          ),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: _goAuth,
                  child: Text(
                    s.skip,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: pages.length,
                  onPageChanged: (i) => setState(() => _index = i),
                  itemBuilder: (_, i) => _OnboardingSlide(page: pages[i]),
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: pages.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 3.2,
                  spacing: 8,
                  activeDotColor: AppColors.primary,
                  dotColor: AppColors.primaryMuted,
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
              PrimaryButton(
                label: isLast ? s.getStarted : s.continueBtn,
                onPressed: _next,
                icon: isLast
                    ? PhosphorIconsBold.arrowRight
                    : PhosphorIconsBold.caretRight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardPage {
  const _OnboardPage({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.accent,
    this.useBrandMark = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color accent;
  final bool useBrandMark;
}

class _OnboardingSlide extends StatelessWidget {
  const _OnboardingSlide({required this.page});

  final _OnboardPage page;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SoftCard(
            gradient: AppColors.gradientCard,
            padding: const EdgeInsets.all(AppSpacing.xxxl),
            child: page.useBrandMark
                ? const MamytoMark(size: 120, glow: true)
                : Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: page.accent,
                      shape: BoxShape.circle,
                      boxShadow: AppShadows.softSm,
                    ),
                    child: Icon(
                      page.icon,
                      size: 56,
                      color: AppColors.primaryDeep,
                    ),
                  ),
          ),
          const SizedBox(height: AppSpacing.xxxl),
          Text(
            page.title,
            textAlign: TextAlign.center,
            style: theme.displaySmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            page.subtitle,
            textAlign: TextAlign.center,
            style: theme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}
