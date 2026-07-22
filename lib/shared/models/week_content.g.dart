// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeekContentImpl _$$WeekContentImplFromJson(Map<String, dynamic> json) =>
    _$WeekContentImpl(
      week: (json['week'] as num).toInt(),
      babyGrowth: json['babyGrowth'] as String,
      motherChanges: json['motherChanges'] as String,
      nutrition: json['nutrition'] as String,
      exercise: json['exercise'] as String,
      warningSigns: json['warningSigns'] as String,
      medicalTips: json['medicalTips'] as String,
      checklist:
          (json['checklist'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      fruitComparison: json['fruitComparison'] as String? ?? 'Papaya',
    );

Map<String, dynamic> _$$WeekContentImplToJson(_$WeekContentImpl instance) =>
    <String, dynamic>{
      'week': instance.week,
      'babyGrowth': instance.babyGrowth,
      'motherChanges': instance.motherChanges,
      'nutrition': instance.nutrition,
      'exercise': instance.exercise,
      'warningSigns': instance.warningSigns,
      'medicalTips': instance.medicalTips,
      'checklist': instance.checklist,
      'fruitComparison': instance.fruitComparison,
    };
