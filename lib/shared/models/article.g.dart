// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
      body: json['body'] as String,
      category: json['category'] as String,
      author: json['author'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      bookmarked: json['bookmarked'] as bool? ?? false,
      liked: json['liked'] as bool? ?? false,
      likes: (json['likes'] as num?)?.toInt() ?? 0,
      trending: json['trending'] as bool? ?? false,
      imageUrl: json['imageUrl'] as String?,
      reviewedBy: json['reviewedBy'] as String? ?? 'Dr. Review Panel',
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'body': instance.body,
      'category': instance.category,
      'author': instance.author,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'bookmarked': instance.bookmarked,
      'liked': instance.liked,
      'likes': instance.likes,
      'trending': instance.trending,
      'imageUrl': instance.imageUrl,
      'reviewedBy': instance.reviewedBy,
    };
