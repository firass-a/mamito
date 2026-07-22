import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

class BabyScreen extends ConsumerWidget {
  const BabyScreen({super.key});

  Future<void> _editBabyName(BuildContext context, WidgetRef ref, String current) async {
    final s = ref.read(stringsProvider);
    final ctrl = TextEditingController(text: current);
    final saved = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadii.xl)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.page,
            AppSpacing.lg,
            AppSpacing.page,
            MediaQuery.of(ctx).viewInsets.bottom + AppSpacing.lg,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(s.babyName, style: Theme.of(ctx).textTheme.titleLarge),
              const SizedBox(height: AppSpacing.sm),
              TextField(
                controller: ctrl,
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: s.babyNameHint,
                  prefixIcon: const Icon(PhosphorIconsRegular.baby, color: AppColors.primary),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              PrimaryButton(
                label: s.save,
                onPressed: () => Navigator.pop(ctx, ctrl.text.trim()),
              ),
            ],
          ),
        );
      },
    );
    ctrl.dispose();
    if (saved != null) {
      ref.read(babyProvider.notifier).setName(saved);
      if (context.mounted) context.showSnack(s.saved);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final baby = ref.watch(babyProvider);
    final theme = context.textTheme;
    final displayName = baby.name.isEmpty ? s.yourBaby : baby.name;

    return GradientScaffold(
      appBar: AppBar(
        title: Text(displayName),
        leading: IconButton(
          icon: const DirectionalIcon(PhosphorIconsRegular.caretLeft),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          IconButton(
            tooltip: s.editBaby,
            onPressed: () => _editBabyName(context, ref, baby.name),
            icon: const Icon(PhosphorIconsRegular.pencilSimple, color: AppColors.primary),
          ),
        ],
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
            gradient: AppColors.gradientHero,
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: AppColors.surface.withValues(alpha: 0.28),
                    shape: BoxShape.circle,
                    boxShadow: AppShadows.soft,
                  ),
                  child: Icon(
                    PhosphorIconsRegular.baby,
                    size: 64,
                    color: AppColors.textOnPrimary.withValues(alpha: 0.95),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  displayName,
                  style: theme.headlineSmall?.copyWith(
                    color: AppColors.textOnPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '${s.weekLabel} ${baby.week}',
                  style: theme.titleMedium?.copyWith(
                    color: AppColors.textOnPrimary.withValues(alpha: 0.95),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  s.babySizeOf(s.fruitLabel(baby.fruitComparison)),
                  textAlign: TextAlign.center,
                  style: theme.titleMedium?.copyWith(
                    color: AppColors.textOnPrimary.withValues(alpha: 0.9),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                SoftChip(
                  label: s.editBaby,
                  selected: true,
                  onTap: () => _editBabyName(context, ref, baby.name),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  label: s.weight,
                  value: '${baby.weightGrams.toStringAsFixed(0)} g',
                  icon: PhosphorIconsRegular.scales,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: StatCard(
                  label: s.length,
                  value: '${baby.lengthCm.toStringAsFixed(1)} cm',
                  icon: PhosphorIconsRegular.ruler,
                  color: AppColors.accent,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          StatCard(
            label: s.heartbeat,
            value: '${baby.heartbeatBpm} bpm',
            icon: PhosphorIconsRegular.heartbeat,
            color: AppColors.success,
          ),
          const SizedBox(height: AppSpacing.xl),
          SectionHeader(title: s.organsDeveloping),
          SoftCard(
            child: Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                for (final organ in baby.organsDeveloping)
                  SoftChip(label: s.organLabel(organ), selected: false, onTap: () {}),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          SectionHeader(title: s.milestones),
          SoftCard(
            child: Column(
              children: [
                for (var i = 0; i < baby.milestones.length; i++) ...[
                  if (i > 0) const Divider(height: AppSpacing.xl, color: AppColors.divider),
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.chipTeal,
                          borderRadius: BorderRadius.circular(AppRadii.sm),
                        ),
                        child: const Icon(
                          PhosphorIconsRegular.checkCircle,
                          color: AppColors.success,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Text(s.milestoneLabel(baby.milestones[i]), style: theme.titleMedium),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
