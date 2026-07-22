import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  bool _isLogin = true;
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void _continue() {
    final s = ref.read(stringsProvider);
    final email = _emailCtrl.text.trim();
    final password = _passwordCtrl.text.trim();
    final name = _nameCtrl.text.trim();

    if (!_isLogin && name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(s.errNameRequired)),
      );
      return;
    }
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(s.errEmailPasswordRequired)),
      );
      return;
    }

    if (!_isLogin && name.isNotEmpty) {
      final current = ref.read(profileProvider);
      ref.read(profileProvider.notifier).update(
            current.copyWith(firstName: name),
          );
    }
    context.go('/setup');
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(stringsProvider);
    final theme = Theme.of(context).textTheme;

    return GradientScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.page,
            AppSpacing.lg,
            AppSpacing.page,
            AppSpacing.xxl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.lg),
              const Center(child: MamytoMark(size: 88, glow: true)),
              const SizedBox(height: AppSpacing.lg),
              Text(
                s.appName,
                textAlign: TextAlign.center,
                style: theme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryDeep,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: AppSpacing.xxs),
              Text(
                _isLogin ? s.welcomeBackSubtitle : s.createAccountSubtitle,
                textAlign: TextAlign.center,
                style: theme.bodyMedium?.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: AppSpacing.xxl),
              SoftCard(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _AuthToggle(
                      isLogin: _isLogin,
                      loginLabel: s.login,
                      signupLabel: s.signup,
                      onChanged: (v) => setState(() => _isLogin = v),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeOut,
                      child: _isLogin
                          ? const SizedBox.shrink()
                          : Padding(
                              padding: const EdgeInsets.only(bottom: AppSpacing.md),
                              child: _AuthField(
                                controller: _nameCtrl,
                                hint: s.firstName,
                                icon: PhosphorIconsRegular.user,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                    ),
                    _AuthField(
                      controller: _emailCtrl,
                      hint: s.email,
                      icon: PhosphorIconsRegular.envelopeSimple,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _AuthField(
                      controller: _passwordCtrl,
                      hint: s.password,
                      icon: PhosphorIconsRegular.lockSimple,
                      obscureText: _obscure,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _continue(),
                      suffix: IconButton(
                        onPressed: () => setState(() => _obscure = !_obscure),
                        icon: Icon(
                          _obscure
                              ? PhosphorIconsRegular.eye
                              : PhosphorIconsRegular.eyeSlash,
                          color: AppColors.textSecondary,
                          size: 22,
                        ),
                      ),
                    ),
                    if (_isLogin) ...[
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            s.forgotPassword,
                            style: theme.labelMedium?.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ] else
                      const SizedBox(height: AppSpacing.lg),
                    PrimaryButton(
                      label: s.continueBtn,
                      onPressed: _continue,
                      icon: PhosphorIconsBold.arrowRight,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                s.termsNotice,
                textAlign: TextAlign.center,
                style: theme.bodySmall?.copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthToggle extends StatelessWidget {
  const _AuthToggle({
    required this.isLogin,
    required this.loginLabel,
    required this.signupLabel,
    required this.onChanged,
  });

  final bool isLogin;
  final String loginLabel;
  final String signupLabel;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.primarySoft,
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      child: Row(
        children: [
          Expanded(
            child: _ToggleChip(
              label: loginLabel,
              selected: isLogin,
              onTap: () => onChanged(true),
            ),
          ),
          Expanded(
            child: _ToggleChip(
              label: signupLabel,
              selected: !isLogin,
              onTap: () => onChanged(false),
            ),
          ),
        ],
      ),
    );
  }
}

class _ToggleChip extends StatelessWidget {
  const _ToggleChip({
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
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? AppColors.surface : Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadii.pill),
            boxShadow: selected ? AppShadows.softSm : null,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: selected ? AppColors.primaryDeep : AppColors.textSecondary,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ),
    );
  }
}

class _AuthField extends StatelessWidget {
  const _AuthField({
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.suffix,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? suffix;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondarySoft,
        borderRadius: BorderRadius.circular(AppRadii.md),
        boxShadow: AppShadows.softSm,
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onSubmitted: onSubmitted,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: AppColors.primary, size: 22),
          suffixIcon: suffix,
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadii.md),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadii.md),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadii.md),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.4),
          ),
        ),
      ),
    );
  }
}
