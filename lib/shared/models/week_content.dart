import 'package:freezed_annotation/freezed_annotation.dart';

part 'week_content.freezed.dart';
part 'week_content.g.dart';

@freezed
class WeekContent with _$WeekContent {
  const factory WeekContent({
    required int week,
    required String babyGrowth,
    required String motherChanges,
    required String nutrition,
    required String exercise,
    required String warningSigns,
    required String medicalTips,
    @Default(<String>[]) List<String> checklist,
    @Default('Papaya') String fruitComparison,
  }) = _WeekContent;

  factory WeekContent.fromJson(Map<String, dynamic> json) =>
      _$WeekContentFromJson(json);
}
