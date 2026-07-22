import 'package:fl_chart/fl_chart.dart';
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

class WeightScreen extends ConsumerWidget {
  const WeightScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final weights = ref.watch(weightsProvider);
    final theme = context.textTheme;
    final latest = weights.isEmpty ? null : weights.last;
    final first = weights.isEmpty ? null : weights.first;
    final delta = (latest != null && first != null) ? latest.kg - first.kg : 0.0;

    return GradientScaffold(
      appBar: AppBar(
        title: Text(s.weight),
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
          Row(
            children: [
              Expanded(
                child: StatCard(
                  label: s.latest,
                  value: latest == null ? '—' : '${latest.kg.toStringAsFixed(1)} kg',
                  icon: PhosphorIconsRegular.scales,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: StatCard(
                  label: s.change,
                  value: latest == null
                      ? '—'
                      : '${delta >= 0 ? '+' : ''}${delta.toStringAsFixed(1)} kg',
                  icon: PhosphorIconsRegular.trendUp,
                  color: AppColors.accent,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          SoftCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(s.progress, style: theme.titleMedium),
                const SizedBox(height: AppSpacing.lg),
                SizedBox(
                  height: 200,
                  child: weights.length < 2
                      ? Center(
                          child: Text(
                            s.addTwoEntriesChart,
                            textAlign: TextAlign.center,
                            style: theme.bodyMedium?.copyWith(color: AppColors.textSecondary),
                          ),
                        )
                      : LineChart(_chartData(weights, s)),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          SectionHeader(title: s.history),
          if (weights.isEmpty)
            SoftCard(
              child: Text(
                s.noWeightEntries,
                style: theme.bodyMedium?.copyWith(color: AppColors.textSecondary),
              ),
            )
          else
            ...weights.reversed.map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: SoftCard(
                  onTap: () => _openSheet(context, ref, existing: e),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${e.kg.toStringAsFixed(1)} kg',
                              style: theme.titleMedium,
                            ),
                            Text(
                              s.formatDate(e.date),
                              style: theme.bodySmall?.copyWith(color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(PhosphorIconsRegular.trash, color: AppColors.danger),
                        onPressed: () async {
                          final ok = await context.confirmDelete(
                            title: s.deleteEntry,
                            cancelLabel: s.cancel,
                            deleteLabel: s.delete,
                          );
                          if (!ok) return;
                          ref.read(weightsProvider.notifier).delete(e.id);
                          if (context.mounted) context.showSnack(s.weightDeleted);
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

  LineChartData _chartData(List<WeightEntry> weights, AppStrings s) {
    final spots = [
      for (var i = 0; i < weights.length; i++) FlSpot(i.toDouble(), weights[i].kg),
    ];
    final minY = weights.map((e) => e.kg).reduce((a, b) => a < b ? a : b) - 1;
    final maxY = weights.map((e) => e.kg).reduce((a, b) => a > b ? a : b) + 1;

    return LineChartData(
      minY: minY,
      maxY: maxY,
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (_) => const FlLine(color: AppColors.divider, strokeWidth: 1),
      ),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            interval: 1,
            getTitlesWidget: (v, _) {
              final i = v.toInt();
              if (i < 0 || i >= weights.length) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  s.formatWeekday(weights[i].date),
                  style: const TextStyle(fontSize: 10, color: AppColors.textSecondary),
                ),
              );
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: (v, _) => Text(
              v.toStringAsFixed(0),
              style: const TextStyle(fontSize: 10, color: AppColors.textSecondary),
            ),
          ),
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: AppColors.primary,
          barWidth: 3,
          dotData: const FlDotData(show: true),
          belowBarData: BarAreaData(
            show: true,
            color: AppColors.primary.withValues(alpha: 0.12),
          ),
        ),
      ],
    );
  }

  Future<void> _openSheet(
    BuildContext context,
    WidgetRef ref, {
    WeightEntry? existing,
  }) async {
    final s = ref.read(stringsProvider);
    final kgCtrl = TextEditingController(
      text: existing?.kg.toStringAsFixed(1) ?? '',
    );
    final noteCtrl = TextEditingController(text: existing?.note ?? '');

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
                existing == null ? s.logWeight : s.editWeight,
                style: ctx.textTheme.titleLarge,
              ),
              const SizedBox(height: AppSpacing.md),
              TextField(
                controller: kgCtrl,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(hintText: s.weightKg, suffixText: 'kg'),
              ),
              const SizedBox(height: AppSpacing.sm),
              TextField(
                controller: noteCtrl,
                decoration: InputDecoration(hintText: s.optionalNote),
              ),
              const SizedBox(height: AppSpacing.lg),
              PrimaryButton(
                label: existing == null ? s.save : s.update,
                onPressed: () {
                  final kg = double.tryParse(kgCtrl.text.trim());
                  if (kg == null || kg <= 0) {
                    context.showSnack(s.enterValidWeight, error: true);
                    return;
                  }
                  final entry = WeightEntry(
                    id: existing?.id ?? _uuid.v4(),
                    kg: kg,
                    date: existing?.date ?? DateTime.now(),
                    note: noteCtrl.text.trim(),
                  );
                  final n = ref.read(weightsProvider.notifier);
                  if (existing == null) {
                    n.add(entry);
                  } else {
                    n.update(entry);
                  }
                  Navigator.pop(ctx);
                  context.showSnack(existing == null ? s.weightSaved : s.weightUpdated);
                },
              ),
            ],
          ),
        );
      },
    );
    kgCtrl.dispose();
    noteCtrl.dispose();
  }
}
