import 'package:freezed_annotation/freezed_annotation.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
class CommunityComment with _$CommunityComment {
  const factory CommunityComment({
    required String id,
    required String author,
    required String text,
    required DateTime createdAt,
    @Default(false) bool isMine,
  }) = _CommunityComment;

  factory CommunityComment.fromJson(Map<String, dynamic> json) =>
      _$CommunityCommentFromJson(json);
}

@freezed
class CommunityPost with _$CommunityPost {
  const factory CommunityPost({
    required String id,
    required String author,
    required String content,
    required DateTime createdAt,
    @Default(0) int likes,
    @Default(false) bool likedByMe,
    @Default(false) bool bookmarked,
    @Default(false) bool pinned,
    @Default(<CommunityComment>[]) List<CommunityComment> comments,
    String? imageUrl,
    @Default('general') String topic,
  }) = _CommunityPost;

  factory CommunityPost.fromJson(Map<String, dynamic> json) =>
      _$CommunityPostFromJson(json);
}
