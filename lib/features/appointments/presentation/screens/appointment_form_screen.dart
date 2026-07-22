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

class AppointmentFormScreen extends ConsumerStatefulWidget {
  const AppointmentFormScreen({super.key, this.id});

  final String? id;

  @override
  ConsumerState<AppointmentFormScreen> createState() => _AppointmentFormScreenState();
}

class _AppointmentFormScreenState extends ConsumerState<AppointmentFormScreen> {
  late final TextEditingController _title;
  late final TextEditingController _doctor;
  late final TextEditingController _hospital;
  late final TextEditingController _location;
  late final TextEditingController _notes;
  late DateTime _dateTime;
  late AppointmentStatus _status;
  Appointment? _existing;

  bool get _isEdit => widget.id != null;

  @override
  void initState() {
    super.initState();
    final list = ref.read(appointmentsProvider);
    _existing = widget.id == null
        ? null
        : list.where((a) => a.id == widget.id).firstOrNull;

    _title = TextEditingController(text: _existing?.title ?? '');
    _doctor = TextEditingController(text: _existing?.doctor ?? '');
    _hospital = TextEditingController(text: _existing?.hospital ?? '');
    _location = TextEditingController(text: _existing?.location ?? '');
    _notes = TextEditingController(text: _existing?.notes ?? '');
    _dateTime = _existing?.dateTime ?? DateTime.now().add(const Duration(days: 1));
    _status = _existing?.status ?? AppointmentStatus.upcoming;
  }

  @override
  void dispose() {
    _title.dispose();
    _doctor.dispose();
    _hospital.dispose();
    _location.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final d = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (d == null) return;
    setState(() {
      _dateTime = DateTime(d.year, d.month, d.day, _dateTime.hour, _dateTime.minute);
    });
  }

  Future<void> _pickTime() async {
    final t = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_dateTime),
    );
    if (t == null) return;
    setState(() {
      _dateTime = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, t.hour, t.minute);
    });
  }

  void _save() {
    final s = ref.read(stringsProvider);
    final title = _title.text.trim();
    final doctor = _doctor.text.trim();
    final hospital = _hospital.text.trim();
    if (title.isEmpty || doctor.isEmpty || hospital.isEmpty) {
      context.showSnack(s.requiredFieldsAppt, error: true);
      return;
    }

    final appt = Appointment(
      id: _existing?.id ?? _uuid.v4(),
      title: title,
      doctor: doctor,
      hospital: hospital,
      location: _location.text.trim(),
      notes: _notes.text.trim(),
      dateTime: _dateTime,
      status: _status,
      specialty: _existing?.specialty,
    );

    final n = ref.read(appointmentsProvider.notifier);
    if (_isEdit) {
      n.update(appt);
    } else {
      n.add(appt);
    }
    context.showSnack(_isEdit ? s.appointmentUpdated : s.appointmentSaved);
    Navigator.of(context).pop();
  }

  Future<void> _delete() async {
    if (_existing == null) return;
    final s = ref.read(stringsProvider);
    final ok = await context.confirmDelete(
      title: s.deleteAppointment,
      cancelLabel: s.cancel,
      deleteLabel: s.delete,
    );
    if (!ok) return;
    ref.read(appointmentsProvider.notifier).delete(_existing!.id);
    if (!mounted) return;
    context.showSnack(s.appointmentDeleted);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(stringsProvider);
    return GradientScaffold(
      appBar: AppBar(
        title: Text(_isEdit ? s.editAppointment : s.newAppointment),
        leading: IconButton(
          icon: const DirectionalIcon(PhosphorIconsRegular.caretLeft),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          if (_isEdit)
            IconButton(
              icon: const Icon(PhosphorIconsRegular.trash, color: AppColors.danger),
              onPressed: _delete,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _title,
                  decoration: InputDecoration(labelText: s.apptTitleLabel),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _doctor,
                  decoration: InputDecoration(labelText: s.doctorLabel),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _hospital,
                  decoration: InputDecoration(labelText: s.hospitalLabel),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _location,
                  decoration: InputDecoration(labelText: s.location),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _notes,
                  maxLines: 3,
                  decoration: InputDecoration(labelText: s.notes),
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Expanded(
                      child: SoftCard(
                        color: AppColors.primarySoft,
                        onTap: _pickDate,
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Row(
                          children: [
                            const Icon(PhosphorIconsRegular.calendar, color: AppColors.primary),
                            const SizedBox(width: AppSpacing.sm),
                            Text(s.formatDate(_dateTime), style: context.textTheme.titleSmall),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: SoftCard(
                        color: AppColors.primarySoft,
                        onTap: _pickTime,
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Row(
                          children: [
                            const Icon(PhosphorIconsRegular.clock, color: AppColors.primary),
                            const SizedBox(width: AppSpacing.sm),
                            Text(s.formatTime(_dateTime), style: context.textTheme.titleSmall),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                DropdownButtonFormField<AppointmentStatus>(
                  value: _status,
                  decoration: InputDecoration(labelText: s.status),
                  items: AppointmentStatus.values
                      .map(
                        (st) => DropdownMenuItem(
                          value: st,
                          child: Text(_statusLabel(s, st)),
                        ),
                      )
                      .toList(),
                  onChanged: (v) {
                    if (v != null) setState(() => _status = v);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          PrimaryButton(
            label: _isEdit ? s.update : s.save,
            onPressed: _save,
          ),
          if (_isEdit) ...[
            const SizedBox(height: AppSpacing.sm),
            SecondaryButton(label: s.delete, onPressed: _delete),
          ],
        ],
      ),
    );
  }

  String _statusLabel(AppStrings s, AppointmentStatus status) => switch (status) {
        AppointmentStatus.upcoming => s.upcoming,
        AppointmentStatus.completed => s.completed,
        AppointmentStatus.cancelled => s.cancelled,
      };
}
