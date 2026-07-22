import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required String id,
    required String title,
    required String summary,
    required String body,
    required String category,
    required String author,
    required DateTime publishedAt,
    @Default(false) bool bookmarked,
    @Default(false) bool liked,
    @Default(0) int likes,
    @Default(false) bool trending,
    String? imageUrl,
    @Default('Dr. Review Panel') String reviewedBy,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
}
