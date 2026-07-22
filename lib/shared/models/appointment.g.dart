// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentImpl _$$AppointmentImplFromJson(Map<String, dynamic> json) =>
    _$AppointmentImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      doctor: json['doctor'] as String,
      hospital: json['hospital'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      status: $enumDecode(_$AppointmentStatusEnumMap, json['status']),
      notes: json['notes'] as String? ?? '',
      location: json['location'] as String? ?? '',
      specialty: json['specialty'] as String?,
    );

Map<String, dynamic> _$$AppointmentImplToJson(_$AppointmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'doctor': instance.doctor,
      'hospital': instance.hospital,
      'dateTime': instance.dateTime.toIso8601String(),
      'status': _$AppointmentStatusEnumMap[instance.status]!,
      'notes': instance.notes,
      'location': instance.location,
      'specialty': instance.specialty,
    };

const _$AppointmentStatusEnumMap = {
  AppointmentStatus.upcoming: 'upcoming',
  AppointmentStatus.completed: 'completed',
  AppointmentStatus.cancelled: 'cancelled',
};
