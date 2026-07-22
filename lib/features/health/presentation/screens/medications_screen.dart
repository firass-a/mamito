import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:uuid/uuid.dart';

import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/models/models.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

const _uuid = Uuid();

class MedicationsScreen extends ConsumerWidget {
  const MedicationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final meds = ref.watch(medicationsProvider);
    final taken = meds.where((m) => m.takenToday).length;

    return GradientScaffold(
      appBar: AppBar(
        title: Text(s.medications),
        leading: IconButton(
          icon: const DirectionalIcon(PhosphorIconsRegular.caretLeft),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => _openSheet(context, ref),
        child: const Icon(PhosphorIconsRegular.plus, color: AppColors.textOnPrimary),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.sm,
          AppSpacing.page,
          AppSpacing.navClearance,
        ),
        children: [
          ProgressCard(
            title: s.today,
            subtitle: s.takenOfCount(taken, meds.length),
            progress: meds.isEmpty ? 0 : taken / meds.length,
          ),
          const SizedBox(height: AppSpacing.lg),
          if (meds.isEmpty)
            EmptyState(
              icon: PhosphorIconsRegular.pill,
              title: s.noMedications,
              subtitle: s.noMedicationsHint,
              actionLabel: s.addMedication,
              onAction: () => _openSheet(context, ref),
            )
          else
            ...meds.map(
              (m) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: SoftCard(
                  onTap: () => _openSheet(context, ref, existing: m),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: m.takenToday ? AppColors.successSoft : AppColors.primarySoft,
                          borderRadius: BorderRadius.circular(AppRadii.md),
                        ),
                        child: Icon(
                          PhosphorIconsRegular.pill,
                          color: m.takenToday ? AppColors.success : AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(s.medicationName(m.name), style: context.textTheme.titleMedium),
                            const SizedBox(height: AppSpacing.xxs),
                            Text(
                              '${s.medicationDosage(m.dosage)} · ${s.medicationSchedule(m.schedule)}',
                              style: context.textTheme.bodySmall
                                  ?.copyWith(color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                      Switch.adaptive(
                        value: m.takenToday,
                        activeColor: AppColors.success,
                        onChanged: (_) {
                          ref.read(medicationsProvider.notifier).toggleTaken(m.id);
                          context.showSnack(
                            m.takenToday ? s.markedNotTaken : s.markedTaken,
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(PhosphorIconsRegular.trash, color: AppColors.danger),
                        onPressed: () async {
                          final ok = await context.confirmDelete(
                            title: s.deleteMedication,
                            cancelLabel: s.cancel,
                            deleteLabel: s.delete,
                          );
                          if (!ok) return;
                          ref.read(medicationsProvider.notifier).delete(m.id);
                          if (context.mounted) context.showSnack(s.medicationDeleted);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _openSheet(
    BuildContext context,
    WidgetRef ref, {
    Medication? existing,
  }) async {
    final s = ref.read(stringsProvider);
    final nameCtrl = TextEditingController(text: existing?.name ?? '');
    final doseCtrl = TextEditingController(text: existing?.dosage ?? '');
    final scheduleCtrl = TextEditingController(text: existing?.schedule ?? '');

    await showModalBottomSheet<void>(
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
            MediaQuery.viewInsetsOf(ctx).bottom + AppSpacing.xl,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                existing == null ? s.addMedication : s.editMedication,
                style: ctx.textTheme.titleLarge,
              ),
              const SizedBox(height: AppSpacing.md),
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(hintText: s.medName),
              ),
              const SizedBox(height: AppSpacing.sm),
              TextField(
                controller: doseCtrl,
                decoration: InputDecoration(hintText: s.dosage),
              ),
              const SizedBox(height: AppSpacing.sm),
              TextField(
                controller: scheduleCtrl,
                decoration: InputDecoration(hintText: s.schedule),
              ),
              const SizedBox(height: AppSpacing.lg),
              PrimaryButton(
                label: existing == null ? s.save : s.update,
                onPressed: () {
                  final name = nameCtrl.text.trim();
                  if (name.isEmpty) {
                    context.showSnack(s.enterAName, error: true);
                    return;
                  }
                  final med = Medication(
                    id: existing?.id ?? _uuid.v4(),
                    name: name,
                    dosage: doseCtrl.text.trim().isEmpty ? s.oneDose : doseCtrl.text.trim(),
                    schedule:
                        scheduleCtrl.text.trim().isEmpty ? s.defaultDaily : scheduleCtrl.text.trim(),
                    takenToday: existing?.takenToday ?? false,
                    active: existing?.active ?? true,
                  );
                  final n = ref.read(medicationsProvider.notifier);
                  if (existing == null) {
                    n.add(med);
                  } else {
                    n.update(med);
                  }
                  Navigator.pop(ctx);
                  context.showSnack(
                    existing == null ? s.medicationSaved : s.medicationUpdated,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
    nameCtrl.dispose();
    doseCtrl.dispose();
    scheduleCtrl.dispose();
  }
}
