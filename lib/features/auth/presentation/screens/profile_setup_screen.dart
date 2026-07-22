import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  late final TextEditingController _nameCtrl;
  final _babyNameCtrl = TextEditingController();
  final _ageCtrl = TextEditingController();
  String _role = 'pregnant';
  DateTime? _dueDate;
  DateTime? _birthDate;
  double _week = 20;
  late final bool _hasNameAlready;

  bool get _needsDueDate => _role == 'pregnant' || _role == 'planning';
  bool get _needsChild => _role == 'newMom' || _role == 'momOfChild';
  bool get _showWeek => _role == 'pregnant';
  bool get _showBabyName => _role != 'planning';

  @override
  void initState() {
    super.initState();
    final existing = ref.read(profileProvider).firstName.trim();
    _hasNameAlready = existing.isNotEmpty;
    _nameCtrl = TextEditingController(text: existing);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _babyNameCtrl.dispose();
    _ageCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDueDate() async {
    final now = DateTime.now();
    final d = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? now.add(const Duration(days: 120)),
      firstDate: now,
      lastDate: now.add(const Duration(days: 300)),
    );
    if (d == null) return;
    setState(() => _dueDate = d);
  }

  Future<void> _pickBirthDate() async {
    final now = DateTime.now();
    final d = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? now.subtract(const Duration(days: 90)),
      firstDate: DateTime(now.year - 7),
      lastDate: now,
    );
    if (d == null) return;
    setState(() => _birthDate = d);
  }

  void _submit() {
    final s = ref.read(stringsProvider);
    final name = _nameCtrl.text.trim();
    if (name.isEmpty) {
      context.showSnack(s.firstName, error: true);
      return;
    }

    final profile = ref.read(profileProvider);
    final childAge = int.tryParse(_ageCtrl.text.trim()) ?? 0;

    ref.read(profileProvider.notifier).update(
          profile.copyWith(
            firstName: name,
            role: _role,
            dueDate: _dueDate ?? profile.dueDate,
            birthDate: _birthDate,
            childAgeMonths: _needsChild ? childAge : 0,
            currentWeek: _showWeek ? _week.round() : profile.currentWeek,
          ),
        );

    final babyName = _babyNameCtrl.text.trim();
    if (_showBabyName) {
      ref.read(babyProvider.notifier).setName(babyName);
    }

    if (_showWeek) {
      ref.read(babyProvider.notifier).syncWeek(_week.round());
      ref.read(selectedWeekProvider.notifier).state = _week.round();
      if (babyName.isNotEmpty) {
        ref.read(babyProvider.notifier).setName(babyName);
      }
    }

    ref.read(onboardingDoneProvider.notifier).state = true;
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(stringsProvider);
    final theme = context.textTheme;

    final roles = <({String id, String label, IconData icon})>[
      (id: 'pregnant', label: s.pregnant, icon: PhosphorIconsFill.heart),
      (id: 'newMom', label: s.newMom, icon: PhosphorIconsFill.baby),
      (id: 'planning', label: s.planning, icon: PhosphorIconsFill.calendarBlank),
      (id: 'momOfChild', label: s.momOfChild, icon: PhosphorIconsFill.users),
    ];

    return GradientScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.page,
                AppSpacing.lg,
                AppSpacing.page,
                AppSpacing.sm,
              ),
              child: Text(
                _hasNameAlready
                    ? '${s.greeting(_nameCtrl.text)} — ${s.whoAreYou}'
                    : s.whoAreYou,
                style: theme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.page,
                  AppSpacing.sm,
                  AppSpacing.page,
                  AppSpacing.xl,
                ),
                children: [
                  if (_hasNameAlready)
                    SoftCard(
                      color: AppColors.primarySoft,
                      child: Row(
                        children: [
                          const Icon(PhosphorIconsFill.user, color: AppColors.primaryDeep),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: Text(
                              _nameCtrl.text,
                              style: theme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: AppColors.primaryDeep,
                              ),
                            ),
                          ),
                          Text(
                            s.firstName,
                            style: theme.labelSmall?.copyWith(color: AppColors.textSecondary),
                          ),
                        ],
                      ),
                    )
                  else
                    SoftCard(
                      child: TextField(
                        controller: _nameCtrl,
                        textInputAction: TextInputAction.next,
                        style: theme.bodyMedium,
                        decoration: InputDecoration(
                          hintText: s.firstName,
                          prefixIcon: const Icon(
                            PhosphorIconsRegular.user,
                            color: AppColors.primary,
                          ),
                          filled: true,
                          fillColor: AppColors.secondarySoft,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppRadii.md),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  if (_showBabyName) ...[
                    const SizedBox(height: AppSpacing.sm),
                    SoftCard(
                      child: TextField(
                        controller: _babyNameCtrl,
                        textInputAction: TextInputAction.next,
                        style: theme.bodyMedium,
                        decoration: InputDecoration(
                          hintText: s.babyName,
                          helperText: s.babyNameHint,
                          prefixIcon: const Icon(
                            PhosphorIconsRegular.baby,
                            color: AppColors.primary,
                          ),
                          filled: true,
                          fillColor: AppColors.secondarySoft,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppRadii.md),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.lg),
                  ...roles.map((r) {
                    final selected = _role == r.id;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: SoftCard(
                        color: selected ? AppColors.primarySoft : AppColors.surface,
                        onTap: () => setState(() => _role = r.id),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: selected
                                    ? AppColors.primary.withValues(alpha: 0.2)
                                    : AppColors.secondarySoft,
                                borderRadius: BorderRadius.circular(AppRadii.sm),
                              ),
                              child: Icon(r.icon, color: AppColors.primaryDeep),
                            ),
                            const SizedBox(width: AppSpacing.md),
                            Expanded(
                              child: Text(
                                r.label,
                                style: theme.titleSmall?.copyWith(
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
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
                  if (_needsDueDate) ...[
                    const SizedBox(height: AppSpacing.md),
                    SoftCard(
                      onTap: _pickDueDate,
                      child: Row(
                        children: [
                          const Icon(
                            PhosphorIconsRegular.calendar,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(s.dueDate, style: theme.titleSmall),
                                const SizedBox(height: AppSpacing.xxs),
                                Text(
                                  _dueDate == null ? '—' : s.formatDate(_dueDate!),
                                  style: theme.bodySmall?.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const DirectionalIcon(
                            PhosphorIconsRegular.caretRight,
                            color: AppColors.textSecondary,
                          ),
                        ],
                      ),
                    ),
                  ],
                  if (_needsChild) ...[
                    const SizedBox(height: AppSpacing.md),
                    SoftCard(
                      onTap: _pickBirthDate,
                      child: Row(
                        children: [
                          const Icon(
                            PhosphorIconsRegular.cake,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(s.birthDate, style: theme.titleSmall),
                                const SizedBox(height: AppSpacing.xxs),
                                Text(
                                  _birthDate == null ? '—' : s.formatDate(_birthDate!),
                                  style: theme.bodySmall?.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const DirectionalIcon(
                            PhosphorIconsRegular.caretRight,
                            color: AppColors.textSecondary,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    SoftCard(
                      child: TextField(
                        controller: _ageCtrl,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          hintText: s.childAge,
                          prefixIcon: const Icon(
                            PhosphorIconsRegular.baby,
                            color: AppColors.primary,
                          ),
                          filled: true,
                          fillColor: AppColors.secondarySoft,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppRadii.md),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                  if (_showWeek) ...[
                    const SizedBox(height: AppSpacing.lg),
                    SoftCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            s.weeksPregnant(_week.round()),
                            style: theme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Slider(
                            value: _week,
                            min: 1,
                            max: 40,
                            divisions: 39,
                            label: '${_week.round()}',
                            activeColor: AppColors.primary,
                            inactiveColor: AppColors.primaryMuted,
                            onChanged: (v) => setState(() => _week = v),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.page,
                0,
                AppSpacing.page,
                AppSpacing.xl,
              ),
              child: PrimaryButton(
                label: s.getStarted,
                icon: PhosphorIconsBold.arrowRight,
                onPressed: _submit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
