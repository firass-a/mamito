import 'package:freezed_annotation/freezed_annotation.dart';

part 'health.freezed.dart';
part 'health.g.dart';

@freezed
class MoodEntry with _$MoodEntry {
  const factory MoodEntry({
    required String id,
    required String mood,
    required DateTime date,
    @Default('') String note,
    @Default(3) int intensity,
  }) = _MoodEntry;

  factory MoodEntry.fromJson(Map<String, dynamic> json) => _$MoodEntryFromJson(json);
}

@freezed
class SymptomEntry with _$SymptomEntry {
  const factory SymptomEntry({
    required String id,
    required String name,
    required DateTime date,
    @Default('mild') String severity,
    @Default('') String note,
  }) = _SymptomEntry;

  factory SymptomEntry.fromJson(Map<String, dynamic> json) =>
      _$SymptomEntryFromJson(json);
}

@freezed
class WeightEntry with _$WeightEntry {
  const factory WeightEntry({
    required String id,
    required double kg,
    required DateTime date,
    @Default('') String note,
  }) = _WeightEntry;

  factory WeightEntry.fromJson(Map<String, dynamic> json) =>
      _$WeightEntryFromJson(json);
}

@freezed
class Medication with _$Medication {
  const factory Medication({
    required String id,
    required String name,
    required String dosage,
    required String schedule,
    @Default(false) bool takenToday,
    @Default(true) bool active,
  }) = _Medication;

  factory Medication.fromJson(Map<String, dynamic> json) =>
      _$MedicationFromJson(json);
}

@freezed
class HydrationDay with _$HydrationDay {
  const factory HydrationDay({
    required DateTime date,
    @Default(0) int glasses,
    @Default(8) int goal,
  }) = _HydrationDay;

  factory HydrationDay.fromJson(Map<String, dynamic> json) =>
      _$HydrationDayFromJson(json);
}

@freezed
class BabyName with _$BabyName {
  const factory BabyName({
    required String id,
    required String name,
    required String meaning,
    required String origin,
    @Default(false) bool favorite,
    @Default('unisex') String gender,
  }) = _BabyName;

  factory BabyName.fromJson(Map<String, dynamic> json) => _$BabyNameFromJson(json);
}
