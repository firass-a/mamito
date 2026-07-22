import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class MotherProfile with _$MotherProfile {
  const factory MotherProfile({
    required String id,
    required String firstName,
    required String lastName,
    required int age,
    required int currentWeek,
    required DateTime dueDate,
    required double weightKg,
    required double heightCm,
    required String bloodType,
    String? partnerName,
    /// pregnant | newMom | planning | momOfChild
    @Default('pregnant') String role,
    String? avatarUrl,
    DateTime? birthDate,
    /// Age of child in months when role is newMom / momOfChild
    @Default(0) int childAgeMonths,
    @Default(false) bool isPremium,
  }) = _MotherProfile;

  factory MotherProfile.fromJson(Map<String, dynamic> json) =>
      _$MotherProfileFromJson(json);
}

@freezed
class BabyProfile with _$BabyProfile {
  const factory BabyProfile({
    required String id,
    @Default('') String name,
    required int week,
    required double weightGrams,
    required double lengthCm,
    required String fruitComparison,
    required int heartbeatBpm,
    @Default(<String>[]) List<String> organsDeveloping,
    @Default(<String>[]) List<String> milestones,
  }) = _BabyProfile;

  factory BabyProfile.fromJson(Map<String, dynamic> json) =>
      _$BabyProfileFromJson(json);
}
