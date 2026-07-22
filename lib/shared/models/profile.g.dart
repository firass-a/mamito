// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MotherProfileImpl _$$MotherProfileImplFromJson(Map<String, dynamic> json) =>
    _$MotherProfileImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      age: (json['age'] as num).toInt(),
      currentWeek: (json['currentWeek'] as num).toInt(),
      dueDate: DateTime.parse(json['dueDate'] as String),
      weightKg: (json['weightKg'] as num).toDouble(),
      heightCm: (json['heightCm'] as num).toDouble(),
      bloodType: json['bloodType'] as String,
      partnerName: json['partnerName'] as String?,
      role: json['role'] as String? ?? 'pregnant',
      avatarUrl: json['avatarUrl'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      childAgeMonths: (json['childAgeMonths'] as num?)?.toInt() ?? 0,
      isPremium: json['isPremium'] as bool? ?? false,
    );

Map<String, dynamic> _$$MotherProfileImplToJson(_$MotherProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
      'currentWeek': instance.currentWeek,
      'dueDate': instance.dueDate.toIso8601String(),
      'weightKg': instance.weightKg,
      'heightCm': instance.heightCm,
      'bloodType': instance.bloodType,
      'partnerName': instance.partnerName,
      'role': instance.role,
      'avatarUrl': instance.avatarUrl,
      'birthDate': instance.birthDate?.toIso8601String(),
      'childAgeMonths': instance.childAgeMonths,
      'isPremium': instance.isPremium,
    };

_$BabyProfileImpl _$$BabyProfileImplFromJson(Map<String, dynamic> json) =>
    _$BabyProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      week: (json['week'] as num).toInt(),
      weightGrams: (json['weightGrams'] as num).toDouble(),
      lengthCm: (json['lengthCm'] as num).toDouble(),
      fruitComparison: json['fruitComparison'] as String,
      heartbeatBpm: (json['heartbeatBpm'] as num).toInt(),
      organsDeveloping:
          (json['organsDeveloping'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      milestones:
          (json['milestones'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$$BabyProfileImplToJson(_$BabyProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'week': instance.week,
      'weightGrams': instance.weightGrams,
      'lengthCm': instance.lengthCm,
      'fruitComparison': instance.fruitComparison,
      'heartbeatBpm': instance.heartbeatBpm,
      'organsDeveloping': instance.organsDeveloping,
      'milestones': instance.milestones,
    };
