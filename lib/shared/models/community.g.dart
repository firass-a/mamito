// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityCommentImpl _$$CommunityCommentImplFromJson(
  Map<String, dynamic> json,
) => _$CommunityCommentImpl(
  id: json['id'] as String,
  author: json['author'] as String,
  text: json['text'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  isMine: json['isMine'] as bool? ?? false,
);

Map<String, dynamic> _$$CommunityCommentImplToJson(
  _$CommunityCommentImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'author': instance.author,
  'text': instance.text,
  'createdAt': instance.createdAt.toIso8601String(),
  'isMine': instance.isMine,
};

_$CommunityPostImpl _$$CommunityPostImplFromJson(Map<String, dynamic> json) =>
    _$CommunityPostImpl(
      id: json['id'] as String,
      author: json['author'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      likes: (json['likes'] as num?)?.toInt() ?? 0,
      likedByMe: json['likedByMe'] as bool? ?? false,
      bookmarked: json['bookmarked'] as bool? ?? false,
      pinned: json['pinned'] as bool? ?? false,
      comments:
          (json['comments'] as List<dynamic>?)
              ?.map((e) => CommunityComment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CommunityComment>[],
      imageUrl: json['imageUrl'] as String?,
      topic: json['topic'] as String? ?? 'general',
    );

Map<String, dynamic> _$$CommunityPostImplToJson(_$CommunityPostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'likes': instance.likes,
      'likedByMe': instance.likedByMe,
      'bookmarked': instance.bookmarked,
      'pinned': instance.pinned,
      'comments': instance.comments,
      'imageUrl': instance.imageUrl,
      'topic': instance.topic,
    };
