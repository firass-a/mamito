// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoodEntryImpl _$$MoodEntryImplFromJson(Map<String, dynamic> json) =>
    _$MoodEntryImpl(
      id: json['id'] as String,
      mood: json['mood'] as String,
      date: DateTime.parse(json['date'] as String),
      note: json['note'] as String? ?? '',
      intensity: (json['intensity'] as num?)?.toInt() ?? 3,
    );

Map<String, dynamic> _$$MoodEntryImplToJson(_$MoodEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mood': instance.mood,
      'date': instance.date.toIso8601String(),
      'note': instance.note,
      'intensity': instance.intensity,
    };

_$SymptomEntryImpl _$$SymptomEntryImplFromJson(Map<String, dynamic> json) =>
    _$SymptomEntryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      date: DateTime.parse(json['date'] as String),
      severity: json['severity'] as String? ?? 'mild',
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$$SymptomEntryImplToJson(_$SymptomEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'severity': instance.severity,
      'note': instance.note,
    };

_$WeightEntryImpl _$$WeightEntryImplFromJson(Map<String, dynamic> json) =>
    _$WeightEntryImpl(
      id: json['id'] as String,
      kg: (json['kg'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$$WeightEntryImplToJson(_$WeightEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kg': instance.kg,
      'date': instance.date.toIso8601String(),
      'note': instance.note,
    };

_$MedicationImpl _$$MedicationImplFromJson(Map<String, dynamic> json) =>
    _$MedicationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      dosage: json['dosage'] as String,
      schedule: json['schedule'] as String,
      takenToday: json['takenToday'] as bool? ?? false,
      active: json['active'] as bool? ?? true,
    );

Map<String, dynamic> _$$MedicationImplToJson(_$MedicationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dosage': instance.dosage,
      'schedule': instance.schedule,
      'takenToday': instance.takenToday,
      'active': instance.active,
    };

_$HydrationDayImpl _$$HydrationDayImplFromJson(Map<String, dynamic> json) =>
    _$HydrationDayImpl(
      date: DateTime.parse(json['date'] as String),
      glasses: (json['glasses'] as num?)?.toInt() ?? 0,
      goal: (json['goal'] as num?)?.toInt() ?? 8,
    );

Map<String, dynamic> _$$HydrationDayImplToJson(_$HydrationDayImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'glasses': instance.glasses,
      'goal': instance.goal,
    };

_$BabyNameImpl _$$BabyNameImplFromJson(Map<String, dynamic> json) =>
    _$BabyNameImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      meaning: json['meaning'] as String,
      origin: json['origin'] as String,
      favorite: json['favorite'] as bool? ?? false,
      gender: json['gender'] as String? ?? 'unisex',
    );

Map<String, dynamic> _$$BabyNameImplToJson(_$BabyNameImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'meaning': instance.meaning,
      'origin': instance.origin,
      'favorite': instance.favorite,
      'gender': instance.gender,
    };
