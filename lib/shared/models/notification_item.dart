import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_item.freezed.dart';
part 'notification_item.g.dart';

enum NotificationType {
  medication,
  appointment,
  weekly,
  water,
  weight,
  kicks,
  community,
  system,
}

@freezed
class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String id,
    required String title,
    required String body,
    required DateTime createdAt,
    required NotificationType type,
    @Default(false) bool read,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);
}
