import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:mamyto/core/extensions/context_extensions.dart';
import 'package:mamyto/core/theme/app_colors.dart';
import 'package:mamyto/core/widgets/widgets.dart';
import 'package:mamyto/l10n/app_strings.dart';
import 'package:mamyto/shared/models/models.dart';
import 'package:mamyto/shared/providers/app_providers.dart';

enum _ApptFilter { upcoming, completed, cancelled, all }

class AppointmentsScreen extends ConsumerStatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  ConsumerState<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends ConsumerState<AppointmentsScreen> {
  final _searchCtrl = TextEditingController();
  DateTime _focused = DateTime.now();
  DateTime? _selected;
  _ApptFilter _filter = _ApptFilter.upcoming;
  String _query = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  List<Appointment> _filtered(List<Appointment> all) {
    final q = _query.toLowerCase();
    return all.where((a) {
      final statusOk = switch (_filter) {
        _ApptFilter.all => true,
        _ApptFilter.upcoming => a.status == AppointmentStatus.upcoming,
        _ApptFilter.completed => a.status == AppointmentStatus.completed,
        _ApptFilter.cancelled => a.status == AppointmentStatus.cancelled,
      };
      final qOk = q.isEmpty ||
          a.title.toLowerCase().contains(q) ||
          a.doctor.toLowerCase().contains(q);
      final dayOk = _selected == null || a.dateTime.isSameDay(_selected!);
      return statusOk && qOk && dayOk;
    }).toList()
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  List<Appointment> _eventsForDay(List<Appointment> all, DateTime day) {
    return all.where((a) => a.dateTime.isSameDay(day)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(stringsProvider);
    final all = ref.watch(appointmentsProvider);
    final list = _filtered(all);

    return GradientScaffold(
      appBar: AppBar(
        title: Text(s.appointments),
        leading: IconButton(
          icon: const DirectionalIcon(PhosphorIconsRegular.caretLeft),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => context.push('/appointments/form'),
        child: const Icon(PhosphorIconsRegular.plus, color: AppColors.textOnPrimary),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.page),
            child: RoundedSearchBar(
              controller: _searchCtrl,
              hint: s.searchApptHint,
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.page),
              children: [
                for (final f in _ApptFilter.values) ...[
                  SoftChip(
                    label: switch (f) {
                      _ApptFilter.upcoming => s.upcoming,
                      _ApptFilter.completed => s.completed,
                      _ApptFilter.cancelled => s.cancelled,
                      _ApptFilter.all => s.all,
                    },
                    selected: _filter == f,
                    onTap: () => setState(() => _filter = f),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                ],
              ],
            ),
          ),
          SoftCard(
            margin: const EdgeInsets.fromLTRB(
              AppSpacing.page,
              AppSpacing.sm,
              AppSpacing.page,
              AppSpacing.sm,
            ),
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: TableCalendar<Appointment>(
              firstDay: DateTime.utc(2020),
              lastDay: DateTime.utc(2035),
              focusedDay: _focused,
              selectedDayPredicate: (d) => _selected != null && d.isSameDay(_selected!),
              eventLoader: (d) => _eventsForDay(all, d),
              calendarFormat: CalendarFormat.month,
              startingDayOfWeek: StartingDayOfWeek.monday,
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle: context.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: AppColors.primarySoft,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                markerDecoration: const BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),
              ),
              onDaySelected: (selected, focused) {
                setState(() {
                  _selected = _selected != null && selected.isSameDay(_selected!)
                      ? null
                      : selected;
                  _focused = focused;
                });
              },
              onPageChanged: (f) => _focused = f,
            ),
          ),
          Expanded(
            child: list.isEmpty
                ? EmptyState(
                    icon: PhosphorIconsRegular.calendarBlank,
                    title: s.noAppointments,
                    subtitle: s.noAppointmentsHint,
                    actionLabel: s.newAppointment,
                    onAction: () => context.push('/appointments/form'),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.page,
                      0,
                      AppSpacing.page,
                      AppSpacing.navClearance,
                    ),
                    itemCount: list.length,
                    separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
                    itemBuilder: (_, i) {
                      final a = list[i];
                      return Dismissible(
                        key: ValueKey(a.id),
                        direction: DismissDirection.endToStart,
                        confirmDismiss: (_) async {
                          return context.confirmDelete(
                            title: s.deleteAppointment,
                            cancelLabel: s.cancel,
                            deleteLabel: s.delete,
                          );
                        },
                        onDismissed: (_) {
                          ref.read(appointmentsProvider.notifier).delete(a.id);
                          context.showSnack(s.appointmentDeleted);
                        },
                        background: Container(
                          alignment: AlignmentDirectional.centerEnd,
                          padding: const EdgeInsetsDirectional.only(
                            end: AppSpacing.lg,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.dangerSoft,
                            borderRadius: BorderRadius.circular(AppRadii.xl),
                          ),
                          child: const Icon(PhosphorIconsRegular.trash, color: AppColors.danger),
                        ),
                        child: SoftCard(
                          onTap: () => context.push('/appointments/form/${a.id}'),
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: _statusColor(a.status).withValues(alpha: 0.18),
                                  borderRadius: BorderRadius.circular(AppRadii.md),
                                ),
                                child: Icon(
                                  PhosphorIconsRegular.calendarCheck,
                                  color: _statusColor(a.status),
                                ),
                              ),
                              const SizedBox(width: AppSpacing.md),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(s.appointmentTitle(a.title), style: context.textTheme.titleMedium),
                                    const SizedBox(height: AppSpacing.xxs),
                                    Text(
                                      '${a.doctor} · ${a.hospital}',
                                      style: context.textTheme.bodySmall
                                          ?.copyWith(color: AppColors.textSecondary),
                                    ),
                                    const SizedBox(height: AppSpacing.xxs),
                                    Text(
                                      '${s.formatDate(a.dateTime)} · ${s.formatTime(a.dateTime)}',
                                      style: context.textTheme.labelMedium?.copyWith(
                                        color: AppColors.primaryDeep,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  SoftChip(
                                    label: _statusLabel(s, a.status),
                                    selected: a.status == AppointmentStatus.upcoming,
                                    onTap: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      PhosphorIconsRegular.trash,
                                      color: AppColors.danger,
                                      size: 20,
                                    ),
                                    onPressed: () async {
                                      final ok = await context.confirmDelete(
                                        title: s.deleteAppointment,
                                        cancelLabel: s.cancel,
                                        deleteLabel: s.delete,
                                      );
                                      if (!ok) return;
                                      ref.read(appointmentsProvider.notifier).delete(a.id);
                                      if (context.mounted) {
                                        context.showSnack(s.appointmentDeleted);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Color _statusColor(AppointmentStatus s) => switch (s) {
        AppointmentStatus.upcoming => AppColors.primary,
        AppointmentStatus.completed => AppColors.success,
        AppointmentStatus.cancelled => AppColors.danger,
      };

  String _statusLabel(AppStrings s, AppointmentStatus status) => switch (status) {
        AppointmentStatus.upcoming => s.upcoming,
        AppointmentStatus.completed => s.completed,
        AppointmentStatus.cancelled => s.cancelled,
      };
}
