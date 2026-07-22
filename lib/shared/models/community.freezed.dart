// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CommunityComment _$CommunityCommentFromJson(Map<String, dynamic> json) {
  return _CommunityComment.fromJson(json);
}

/// @nodoc
mixin _$CommunityComment {
  String get id => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isMine => throw _privateConstructorUsedError;

  /// Serializes this CommunityComment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommunityComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunityCommentCopyWith<CommunityComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityCommentCopyWith<$Res> {
  factory $CommunityCommentCopyWith(
    CommunityComment value,
    $Res Function(CommunityComment) then,
  ) = _$CommunityCommentCopyWithImpl<$Res, CommunityComment>;
  @useResult
  $Res call({
    String id,
    String author,
    String text,
    DateTime createdAt,
    bool isMine,
  });
}

/// @nodoc
class _$CommunityCommentCopyWithImpl<$Res, $Val extends CommunityComment>
    implements $CommunityCommentCopyWith<$Res> {
  _$CommunityCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunityComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? text = null,
    Object? createdAt = null,
    Object? isMine = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            author: null == author
                ? _value.author
                : author // ignore: cast_nullable_to_non_nullable
                      as String,
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isMine: null == isMine
                ? _value.isMine
                : isMine // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CommunityCommentImplCopyWith<$Res>
    implements $CommunityCommentCopyWith<$Res> {
  factory _$$CommunityCommentImplCopyWith(
    _$CommunityCommentImpl value,
    $Res Function(_$CommunityCommentImpl) then,
  ) = __$$CommunityCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String author,
    String text,
    DateTime createdAt,
    bool isMine,
  });
}

/// @nodoc
class __$$CommunityCommentImplCopyWithImpl<$Res>
    extends _$CommunityCommentCopyWithImpl<$Res, _$CommunityCommentImpl>
    implements _$$CommunityCommentImplCopyWith<$Res> {
  __$$CommunityCommentImplCopyWithImpl(
    _$CommunityCommentImpl _value,
    $Res Function(_$CommunityCommentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CommunityComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? text = null,
    Object? createdAt = null,
    Object? isMine = null,
  }) {
    return _then(
      _$CommunityCommentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        author: null == author
            ? _value.author
            : author // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isMine: null == isMine
            ? _value.isMine
            : isMine // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunityCommentImpl implements _CommunityComment {
  const _$CommunityCommentImpl({
    required this.id,
    required this.author,
    required this.text,
    required this.createdAt,
    this.isMine = false,
  });

  factory _$CommunityCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunityCommentImplFromJson(json);

  @override
  final String id;
  @override
  final String author;
  @override
  final String text;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isMine;

  @override
  String toString() {
    return 'CommunityComment(id: $id, author: $author, text: $text, createdAt: $createdAt, isMine: $isMine)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityCommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isMine, isMine) || other.isMine == isMine));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, author, text, createdAt, isMine);

  /// Create a copy of CommunityComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityCommentImplCopyWith<_$CommunityCommentImpl> get copyWith =>
      __$$CommunityCommentImplCopyWithImpl<_$CommunityCommentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityCommentImplToJson(this);
  }
}

abstract class _CommunityComment implements CommunityComment {
  const factory _CommunityComment({
    required final String id,
    required final String author,
    required final String text,
    required final DateTime createdAt,
    final bool isMine,
  }) = _$CommunityCommentImpl;

  factory _CommunityComment.fromJson(Map<String, dynamic> json) =
      _$CommunityCommentImpl.fromJson;

  @override
  String get id;
  @override
  String get author;
  @override
  String get text;
  @override
  DateTime get createdAt;
  @override
  bool get isMine;

  /// Create a copy of CommunityComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityCommentImplCopyWith<_$CommunityCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommunityPost _$CommunityPostFromJson(Map<String, dynamic> json) {
  return _CommunityPost.fromJson(json);
}

/// @nodoc
mixin _$CommunityPost {
  String get id => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  bool get likedByMe => throw _privateConstructorUsedError;
  bool get bookmarked => throw _privateConstructorUsedError;
  bool get pinned => throw _privateConstructorUsedError;
  List<CommunityComment> get comments => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;

  /// Serializes this CommunityPost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommunityPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunityPostCopyWith<CommunityPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityPostCopyWith<$Res> {
  factory $CommunityPostCopyWith(
    CommunityPost value,
    $Res Function(CommunityPost) then,
  ) = _$CommunityPostCopyWithImpl<$Res, CommunityPost>;
  @useResult
  $Res call({
    String id,
    String author,
    String content,
    DateTime createdAt,
    int likes,
    bool likedByMe,
    bool bookmarked,
    bool pinned,
    List<CommunityComment> comments,
    String? imageUrl,
    String topic,
  });
}

/// @nodoc
class _$CommunityPostCopyWithImpl<$Res, $Val extends CommunityPost>
    implements $CommunityPostCopyWith<$Res> {
  _$CommunityPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunityPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? content = null,
    Object? createdAt = null,
    Object? likes = null,
    Object? likedByMe = null,
    Object? bookmarked = null,
    Object? pinned = null,
    Object? comments = null,
    Object? imageUrl = freezed,
    Object? topic = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            author: null == author
                ? _value.author
                : author // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            likes: null == likes
                ? _value.likes
                : likes // ignore: cast_nullable_to_non_nullable
                      as int,
            likedByMe: null == likedByMe
                ? _value.likedByMe
                : likedByMe // ignore: cast_nullable_to_non_nullable
                      as bool,
            bookmarked: null == bookmarked
                ? _value.bookmarked
                : bookmarked // ignore: cast_nullable_to_non_nullable
                      as bool,
            pinned: null == pinned
                ? _value.pinned
                : pinned // ignore: cast_nullable_to_non_nullable
                      as bool,
            comments: null == comments
                ? _value.comments
                : comments // ignore: cast_nullable_to_non_nullable
                      as List<CommunityComment>,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            topic: null == topic
                ? _value.topic
                : topic // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CommunityPostImplCopyWith<$Res>
    implements $CommunityPostCopyWith<$Res> {
  factory _$$CommunityPostImplCopyWith(
    _$CommunityPostImpl value,
    $Res Function(_$CommunityPostImpl) then,
  ) = __$$CommunityPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String author,
    String content,
    DateTime createdAt,
    int likes,
    bool likedByMe,
    bool bookmarked,
    bool pinned,
    List<CommunityComment> comments,
    String? imageUrl,
    String topic,
  });
}

/// @nodoc
class __$$CommunityPostImplCopyWithImpl<$Res>
    extends _$CommunityPostCopyWithImpl<$Res, _$CommunityPostImpl>
    implements _$$CommunityPostImplCopyWith<$Res> {
  __$$CommunityPostImplCopyWithImpl(
    _$CommunityPostImpl _value,
    $Res Function(_$CommunityPostImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CommunityPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? content = null,
    Object? createdAt = null,
    Object? likes = null,
    Object? likedByMe = null,
    Object? bookmarked = null,
    Object? pinned = null,
    Object? comments = null,
    Object? imageUrl = freezed,
    Object? topic = null,
  }) {
    return _then(
      _$CommunityPostImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        author: null == author
            ? _value.author
            : author // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        likes: null == likes
            ? _value.likes
            : likes // ignore: cast_nullable_to_non_nullable
                  as int,
        likedByMe: null == likedByMe
            ? _value.likedByMe
            : likedByMe // ignore: cast_nullable_to_non_nullable
                  as bool,
        bookmarked: null == bookmarked
            ? _value.bookmarked
            : bookmarked // ignore: cast_nullable_to_non_nullable
                  as bool,
        pinned: null == pinned
            ? _value.pinned
            : pinned // ignore: cast_nullable_to_non_nullable
                  as bool,
        comments: null == comments
            ? _value._comments
            : comments // ignore: cast_nullable_to_non_nullable
                  as List<CommunityComment>,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        topic: null == topic
            ? _value.topic
            : topic // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunityPostImpl implements _CommunityPost {
  const _$CommunityPostImpl({
    required this.id,
    required this.author,
    required this.content,
    required this.createdAt,
    this.likes = 0,
    this.likedByMe = false,
    this.bookmarked = false,
    this.pinned = false,
    final List<CommunityComment> comments = const <CommunityComment>[],
    this.imageUrl,
    this.topic = 'general',
  }) : _comments = comments;

  factory _$CommunityPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunityPostImplFromJson(json);

  @override
  final String id;
  @override
  final String author;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final int likes;
  @override
  @JsonKey()
  final bool likedByMe;
  @override
  @JsonKey()
  final bool bookmarked;
  @override
  @JsonKey()
  final bool pinned;
  final List<CommunityComment> _comments;
  @override
  @JsonKey()
  List<CommunityComment> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  final String? imageUrl;
  @override
  @JsonKey()
  final String topic;

  @override
  String toString() {
    return 'CommunityPost(id: $id, author: $author, content: $content, createdAt: $createdAt, likes: $likes, likedByMe: $likedByMe, bookmarked: $bookmarked, pinned: $pinned, comments: $comments, imageUrl: $imageUrl, topic: $topic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityPostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.likedByMe, likedByMe) ||
                other.likedByMe == likedByMe) &&
            (identical(other.bookmarked, bookmarked) ||
                other.bookmarked == bookmarked) &&
            (identical(other.pinned, pinned) || other.pinned == pinned) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.topic, topic) || other.topic == topic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    author,
    content,
    createdAt,
    likes,
    likedByMe,
    bookmarked,
    pinned,
    const DeepCollectionEquality().hash(_comments),
    imageUrl,
    topic,
  );

  /// Create a copy of CommunityPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityPostImplCopyWith<_$CommunityPostImpl> get copyWith =>
      __$$CommunityPostImplCopyWithImpl<_$CommunityPostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityPostImplToJson(this);
  }
}

abstract class _CommunityPost implements CommunityPost {
  const factory _CommunityPost({
    required final String id,
    required final String author,
    required final String content,
    required final DateTime createdAt,
    final int likes,
    final bool likedByMe,
    final bool bookmarked,
    final bool pinned,
    final List<CommunityComment> comments,
    final String? imageUrl,
    final String topic,
  }) = _$CommunityPostImpl;

  factory _CommunityPost.fromJson(Map<String, dynamic> json) =
      _$CommunityPostImpl.fromJson;

  @override
  String get id;
  @override
  String get author;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  int get likes;
  @override
  bool get likedByMe;
  @override
  bool get bookmarked;
  @override
  bool get pinned;
  @override
  List<CommunityComment> get comments;
  @override
  String? get imageUrl;
  @override
  String get topic;

  /// Create a copy of CommunityPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityPostImplCopyWith<_$CommunityPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
