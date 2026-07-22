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

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _editing = false;
  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _age;
  late TextEditingController _weight;
  late TextEditingController _height;
  late TextEditingController _blood;
  late TextEditingController _partner;
  late TextEditingController _babyName;
  DateTime? _dueDate;

  static const _achievements = [
    'Week 20',
    'First kick',
    'Ultrasound day',
    'Hydration streak',
    'Mood logger',
  ];

  @override
  void initState() {
    super.initState();
    final p = ref.read(profileProvider);
    _firstName = TextEditingController(text: p.firstName);
    _lastName = TextEditingController(text: p.lastName);
    _age = TextEditingController(text: '${p.age}');
    _weight = TextEditingController(text: p.weightKg.toStringAsFixed(0));
    _height = TextEditingController(text: p.heightCm.toStringAsFixed(0));
    _blood = TextEditingController(text: p.bloodType);
    _partner = TextEditingController(text: p.partnerName ?? '');
    _babyName = TextEditingController(text: ref.read(babyProvider).name);
    _dueDate = p.dueDate;
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _age.dispose();
    _weight.dispose();
    _height.dispose();
    _blood.dispose();
    _partner.dispose();
    _babyName.dispose();
    super.dispose();
  }

  void _syncFrom(MotherProfile p) {
    _firstName.text = p.firstName;
    _lastName.text = p.lastName;
    _age.text = '${p.age}';
    _weight.text = p.weightKg.toStringAsFixed(0);
    _height.text = p.heightCm.toStringAsFixed(0);
    _blood.text = p.bloodType;
    _partner.text = p.partnerName ?? '';
    _dueDate = p.dueDate;
  }

  void _save() {
    final current = ref.read(profileProvider);
    final age = int.tryParse(_age.text.trim()) ?? current.age;
    final weight = double.tryParse(_weight.text.trim()) ?? current.weightKg;
    final height = double.tryParse(_height.text.trim()) ?? current.heightCm;
    final partner = _partner.text.trim();

    ref.read(profileProvider.notifier).update(
          current.copyWith(
            firstName: _firstName.text.trim().isEmpty ? current.firstName : _firstName.text.trim(),
            lastName: _lastName.text.trim().isEmpty ? current.lastName : _lastName.text.trim(),
            age: age,
            weightKg: weight,
            heightCm: height,
            bloodType: _blood.text.trim().isEmpty ? current.bloodType : _blood.text.trim(),
            partnerName: partner.isEmpty ? null : partner,
            dueDate: _dueDate ?? current.dueDate,
          ),
        );
    setState(() => _editing = false);
    context.showSnack(ref.read(stringsProvider).saved);
  }

  Future<void> _pickDueDate() async {
    final initial = _dueDate ?? DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 300)),
    );
    if (picked != null) setState(() => _dueDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(stringsProvider);
    final profile = ref.watch(profileProvider);
    final theme = context.textTheme;

    return GradientScaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.page,
            AppSpacing.md,
            AppSpacing.page,
            AppSpacing.navClearance,
          ),
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    s.profile,
                    style: theme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
                  ),
                ),
                IconButton(
                  tooltip: _editing ? s.save : s.edit,
                  icon: Icon(
                    _editing ? PhosphorIconsRegular.check : PhosphorIconsRegular.pencilSimple,
                    color: AppColors.primary,
                  ),
                  onPressed: () {
                    if (_editing) {
                      _save();
                    } else {
                      _syncFrom(profile);
                      setState(() => _editing = true);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            SoftCard(
              gradient: AppColors.gradientCard,
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: AppColors.gradientHero,
                      borderRadius: BorderRadius.circular(AppRadii.xl),
                      boxShadow: AppShadows.softSm,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${profile.firstName} ${profile.lastName}'.initials,
                      style: theme.headlineSmall?.copyWith(
                        color: AppColors.textOnPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  if (!_editing)
                    Text(
                      '${profile.firstName} ${profile.lastName}',
                      style: theme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: _Field(controller: _firstName, label: s.firstName),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: _Field(controller: _lastName, label: s.lastName),
                        ),
                      ],
                    ),
                  const SizedBox(height: AppSpacing.md),
                  if (!_editing) ...[
                    _InfoRow(
                      icon: PhosphorIconsRegular.cake,
                      label: s.age,
                      value: '${profile.age} ${s.yearsUnit}',
                    ),
                    _InfoRow(
                      icon: PhosphorIconsRegular.scales,
                      label: s.weight,
                      value: '${profile.weightKg.toStringAsFixed(0)} kg',
                    ),
                    _InfoRow(
                      icon: PhosphorIconsRegular.ruler,
                      label: s.height,
                      value: '${profile.heightCm.toStringAsFixed(0)} cm',
                    ),
                    _InfoRow(
                      icon: PhosphorIconsRegular.drop,
                      label: s.blood,
                      value: profile.bloodType,
                    ),
                    _InfoRow(
                      icon: PhosphorIconsRegular.heart,
                      label: s.partner,
                      value: profile.partnerName ?? '—',
                    ),
                    _InfoRow(
                      icon: PhosphorIconsRegular.calendarHeart,
                      label: s.dueDate,
                      value: s.formatDate(profile.dueDate),
                    ),
                  ] else ...[
                    Row(
                      children: [
                        Expanded(child: _Field(controller: _age, label: s.age, keyboard: TextInputType.number)),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: _Field(
                            controller: _weight,
                            label: s.weightKg,
                            keyboard: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        Expanded(
                          child: _Field(
                            controller: _height,
                            label: s.heightCm,
                            keyboard: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(child: _Field(controller: _blood, label: s.bloodType)),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    _Field(controller: _partner, label: s.partner),
                    const SizedBox(height: AppSpacing.sm),
                    SoftCard(
                      onTap: _pickDueDate,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.sm,
                      ),
                      color: AppColors.surface,
                      child: Row(
                        children: [
                          const Icon(PhosphorIconsRegular.calendarHeart, color: AppColors.primary),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: Text(
                              '${s.dueDate} · ${s.formatDate(_dueDate ?? profile.dueDate)}',
                              style: theme.bodyMedium,
                            ),
                          ),
                          const DirectionalIcon(PhosphorIconsRegular.caretRight, color: AppColors.textSecondary),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    PrimaryButton(label: s.saveProfile, onPressed: _save),
                  ],
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            SoftCard(
              gradient: const LinearGradient(
                colors: [Color(0xFFEDE4FF), Color(0xFFFFF0F5)],
              ),
              onTap: () {
                final p = ref.read(profileProvider);
                final next = !(p.isPremium || ref.read(premiumProvider));
                ref.read(premiumProvider.notifier).state = next;
                ref.read(profileProvider.notifier).update(p.copyWith(isPremium: next));
                context.showSnack(next ? s.premiumActive : s.premium);
              },
              child: Row(
                children: [
                  Icon(PhosphorIconsFill.crown, color: AppColors.primary, size: 36),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (profile.isPremium || ref.watch(premiumProvider))
                              ? '${s.premium} ✓'
                              : s.premium,
                          style: theme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                        ),
                        Text(
                          s.premiumDesc,
                          style: theme.bodySmall?.copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                  SoftChip(
                    label: (profile.isPremium || ref.watch(premiumProvider)) ? s.active : s.upgrade,
                    selected: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            SoftCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          ref.watch(stringsProvider).yourBaby,
                          style: theme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.push('/baby'),
                        child: Text(ref.watch(stringsProvider).seeAll),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  TextField(
                    controller: _babyName,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: ref.watch(stringsProvider).babyName,
                      hintText: ref.watch(stringsProvider).babyNameHint,
                      prefixIcon: const Icon(PhosphorIconsRegular.baby, color: AppColors.primary),
                    ),
                    onSubmitted: (v) {
                      ref.read(babyProvider.notifier).setName(v);
                      context.showSnack(ref.read(stringsProvider).saved);
                    },
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  PrimaryButton(
                    label: ref.watch(stringsProvider).save,
                    onPressed: () {
                      ref.read(babyProvider.notifier).setName(_babyName.text);
                      context.showSnack(ref.read(stringsProvider).saved);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            SectionHeader(title: s.achievements),
            const SizedBox(height: AppSpacing.xs),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                for (final a in _achievements)
                  SoftChip(label: s.achievementLabel(a), selected: true, onTap: () {}),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            SectionHeader(title: s.shortcuts),
            const SizedBox(height: AppSpacing.xs),
            _LinkTile(
              icon: PhosphorIconsRegular.bag,
              title: s.shortcutStore,
              subtitle: s.shortcutStoreSub,
              onTap: () => context.go('/store'),
            ),
            _LinkTile(
              icon: PhosphorIconsRegular.chatsTeardrop,
              title: s.shortcutChats,
              subtitle: s.shortcutChatsSub,
              onTap: () => context.push('/chats'),
            ),
            _LinkTile(
              icon: PhosphorIconsRegular.baby,
              title: s.shortcutBaby,
              subtitle: s.shortcutBabySub,
              onTap: () => context.push('/baby'),
            ),
            _LinkTile(
              icon: PhosphorIconsRegular.sparkle,
              title: s.shortcutNames,
              subtitle: s.shortcutNamesSub,
              onTap: () => context.push('/baby-names'),
            ),
            _LinkTile(
              icon: PhosphorIconsRegular.calendarBlank,
              title: s.shortcutAppts,
              subtitle: s.shortcutApptsSub,
              onTap: () => context.push('/appointments'),
            ),
            _LinkTile(
              icon: PhosphorIconsRegular.pill,
              title: s.shortcutMeds,
              subtitle: s.shortcutMedsSub,
              onTap: () => context.push('/medications'),
            ),
            _LinkTile(
              icon: PhosphorIconsRegular.gear,
              title: s.shortcutSettings,
              subtitle: s.shortcutSettingsSub,
              onTap: () => context.push('/settings'),
            ),
            _LinkTile(
              icon: PhosphorIconsRegular.bell,
              title: s.shortcutNotifs,
              subtitle: s.shortcutNotifsSub,
              onTap: () => context.push('/notifications'),
            ),
            const SizedBox(height: AppSpacing.lg),
            SoftCard(
              onTap: () {
                ref.read(onboardingDoneProvider.notifier).state = false;
                context.go('/auth');
              },
              color: AppColors.dangerSoft,
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(AppRadii.md),
                    ),
                    child: const Icon(PhosphorIconsRegular.signOut, color: AppColors.danger),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text(
                      s.logout,
                      style: theme.titleMedium?.copyWith(
                        color: AppColors.danger,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const DirectionalIcon(PhosphorIconsRegular.caretRight, color: AppColors.danger),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.controller,
    required this.label,
    this.keyboard,
  });

  final TextEditingController controller;
  final String label;
  final TextInputType? keyboard;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.md),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.md),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.4),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.primary),
          const SizedBox(width: AppSpacing.sm),
          Text(
            label,
            style: context.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
          ),
          const Spacer(),
          Text(
            value,
            style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _LinkTile extends StatelessWidget {
  const _LinkTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: HealthCard(
        icon: icon,
        title: title,
        subtitle: subtitle,
        onTap: onTap,
        trailing: const DirectionalIcon(PhosphorIconsRegular.caretRight, color: AppColors.textSecondary),
      ),
    );
  }
}
