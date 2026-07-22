// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return _Article.fromJson(json);
}

/// @nodoc
mixin _$Article {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  DateTime get publishedAt => throw _privateConstructorUsedError;
  bool get bookmarked => throw _privateConstructorUsedError;
  bool get liked => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  bool get trending => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get reviewedBy => throw _privateConstructorUsedError;

  /// Serializes this Article to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Article
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArticleCopyWith<Article> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleCopyWith<$Res> {
  factory $ArticleCopyWith(Article value, $Res Function(Article) then) =
      _$ArticleCopyWithImpl<$Res, Article>;
  @useResult
  $Res call({
    String id,
    String title,
    String summary,
    String body,
    String category,
    String author,
    DateTime publishedAt,
    bool bookmarked,
    bool liked,
    int likes,
    bool trending,
    String? imageUrl,
    String reviewedBy,
  });
}

/// @nodoc
class _$ArticleCopyWithImpl<$Res, $Val extends Article>
    implements $ArticleCopyWith<$Res> {
  _$ArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Article
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? summary = null,
    Object? body = null,
    Object? category = null,
    Object? author = null,
    Object? publishedAt = null,
    Object? bookmarked = null,
    Object? liked = null,
    Object? likes = null,
    Object? trending = null,
    Object? imageUrl = freezed,
    Object? reviewedBy = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String,
            body: null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            author: null == author
                ? _value.author
                : author // ignore: cast_nullable_to_non_nullable
                      as String,
            publishedAt: null == publishedAt
                ? _value.publishedAt
                : publishedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            bookmarked: null == bookmarked
                ? _value.bookmarked
                : bookmarked // ignore: cast_nullable_to_non_nullable
                      as bool,
            liked: null == liked
                ? _value.liked
                : liked // ignore: cast_nullable_to_non_nullable
                      as bool,
            likes: null == likes
                ? _value.likes
                : likes // ignore: cast_nullable_to_non_nullable
                      as int,
            trending: null == trending
                ? _value.trending
                : trending // ignore: cast_nullable_to_non_nullable
                      as bool,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            reviewedBy: null == reviewedBy
                ? _value.reviewedBy
                : reviewedBy // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ArticleImplCopyWith<$Res> implements $ArticleCopyWith<$Res> {
  factory _$$ArticleImplCopyWith(
    _$ArticleImpl value,
    $Res Function(_$ArticleImpl) then,
  ) = __$$ArticleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String summary,
    String body,
    String category,
    String author,
    DateTime publishedAt,
    bool bookmarked,
    bool liked,
    int likes,
    bool trending,
    String? imageUrl,
    String reviewedBy,
  });
}

/// @nodoc
class __$$ArticleImplCopyWithImpl<$Res>
    extends _$ArticleCopyWithImpl<$Res, _$ArticleImpl>
    implements _$$ArticleImplCopyWith<$Res> {
  __$$ArticleImplCopyWithImpl(
    _$ArticleImpl _value,
    $Res Function(_$ArticleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Article
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? summary = null,
    Object? body = null,
    Object? category = null,
    Object? author = null,
    Object? publishedAt = null,
    Object? bookmarked = null,
    Object? liked = null,
    Object? likes = null,
    Object? trending = null,
    Object? imageUrl = freezed,
    Object? reviewedBy = null,
  }) {
    return _then(
      _$ArticleImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String,
        body: null == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        author: null == author
            ? _value.author
            : author // ignore: cast_nullable_to_non_nullable
                  as String,
        publishedAt: null == publishedAt
            ? _value.publishedAt
            : publishedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        bookmarked: null == bookmarked
            ? _value.bookmarked
            : bookmarked // ignore: cast_nullable_to_non_nullable
                  as bool,
        liked: null == liked
            ? _value.liked
            : liked // ignore: cast_nullable_to_non_nullable
                  as bool,
        likes: null == likes
            ? _value.likes
            : likes // ignore: cast_nullable_to_non_nullable
                  as int,
        trending: null == trending
            ? _value.trending
            : trending // ignore: cast_nullable_to_non_nullable
                  as bool,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        reviewedBy: null == reviewedBy
            ? _value.reviewedBy
            : reviewedBy // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleImpl implements _Article {
  const _$ArticleImpl({
    required this.id,
    required this.title,
    required this.summary,
    required this.body,
    required this.category,
    required this.author,
    required this.publishedAt,
    this.bookmarked = false,
    this.liked = false,
    this.likes = 0,
    this.trending = false,
    this.imageUrl,
    this.reviewedBy = 'Dr. Review Panel',
  });

  factory _$ArticleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String summary;
  @override
  final String body;
  @override
  final String category;
  @override
  final String author;
  @override
  final DateTime publishedAt;
  @override
  @JsonKey()
  final bool bookmarked;
  @override
  @JsonKey()
  final bool liked;
  @override
  @JsonKey()
  final int likes;
  @override
  @JsonKey()
  final bool trending;
  @override
  final String? imageUrl;
  @override
  @JsonKey()
  final String reviewedBy;

  @override
  String toString() {
    return 'Article(id: $id, title: $title, summary: $summary, body: $body, category: $category, author: $author, publishedAt: $publishedAt, bookmarked: $bookmarked, liked: $liked, likes: $likes, trending: $trending, imageUrl: $imageUrl, reviewedBy: $reviewedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.bookmarked, bookmarked) ||
                other.bookmarked == bookmarked) &&
            (identical(other.liked, liked) || other.liked == liked) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.trending, trending) ||
                other.trending == trending) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.reviewedBy, reviewedBy) ||
                other.reviewedBy == reviewedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    summary,
    body,
    category,
    author,
    publishedAt,
    bookmarked,
    liked,
    likes,
    trending,
    imageUrl,
    reviewedBy,
  );

  /// Create a copy of Article
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleImplCopyWith<_$ArticleImpl> get copyWith =>
      __$$ArticleImplCopyWithImpl<_$ArticleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleImplToJson(this);
  }
}

abstract class _Article implements Article {
  const factory _Article({
    required final String id,
    required final String title,
    required final String summary,
    required final String body,
    required final String category,
    required final String author,
    required final DateTime publishedAt,
    final bool bookmarked,
    final bool liked,
    final int likes,
    final bool trending,
    final String? imageUrl,
    final String reviewedBy,
  }) = _$ArticleImpl;

  factory _Article.fromJson(Map<String, dynamic> json) = _$ArticleImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get summary;
  @override
  String get body;
  @override
  String get category;
  @override
  String get author;
  @override
  DateTime get publishedAt;
  @override
  bool get bookmarked;
  @override
  bool get liked;
  @override
  int get likes;
  @override
  bool get trending;
  @override
  String? get imageUrl;
  @override
  String get reviewedBy;

  /// Create a copy of Article
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticleImplCopyWith<_$ArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
