// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRoomImpl _$$ChatRoomImplFromJson(Map<String, dynamic> json) =>
    _$ChatRoomImpl(
      id: json['id'] as String,
      nameAr: json['nameAr'] as String,
      nameFr: json['nameFr'] as String,
      nameEn: json['nameEn'] as String,
      memberCount: (json['memberCount'] as num).toInt(),
      lastActivity: json['lastActivity'] as String,
      iconCode: (json['iconCode'] as num).toInt(),
      gentle: json['gentle'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChatRoomImplToJson(_$ChatRoomImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameAr': instance.nameAr,
      'nameFr': instance.nameFr,
      'nameEn': instance.nameEn,
      'memberCount': instance.memberCount,
      'lastActivity': instance.lastActivity,
      'iconCode': instance.iconCode,
      'gentle': instance.gentle,
    };

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      id: json['id'] as String,
      author: json['author'] as String,
      text: json['text'] as String,
      time: json['time'] as String,
      isMe: json['isMe'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'text': instance.text,
      'time': instance.time,
      'isMe': instance.isMe,
    };
