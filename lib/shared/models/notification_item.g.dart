// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppNotificationImpl _$$AppNotificationImplFromJson(
  Map<String, dynamic> json,
) => _$AppNotificationImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  body: json['body'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
  read: json['read'] as bool? ?? false,
);

Map<String, dynamic> _$$AppNotificationImplToJson(
  _$AppNotificationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'body': instance.body,
  'createdAt': instance.createdAt.toIso8601String(),
  'type': _$NotificationTypeEnumMap[instance.type]!,
  'read': instance.read,
};

const _$NotificationTypeEnumMap = {
  NotificationType.medication: 'medication',
  NotificationType.appointment: 'appointment',
  NotificationType.weekly: 'weekly',
  NotificationType.water: 'water',
  NotificationType.weight: 'weight',
  NotificationType.kicks: 'kicks',
  NotificationType.community: 'community',
  NotificationType.system: 'system',
};
