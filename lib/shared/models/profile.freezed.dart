// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MotherProfile _$MotherProfileFromJson(Map<String, dynamic> json) {
  return _MotherProfile.fromJson(json);
}

/// @nodoc
mixin _$MotherProfile {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  int get currentWeek => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  double get weightKg => throw _privateConstructorUsedError;
  double get heightCm => throw _privateConstructorUsedError;
  String get bloodType => throw _privateConstructorUsedError;
  String? get partnerName => throw _privateConstructorUsedError;

  /// pregnant | newMom | planning | momOfChild
  String get role => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  DateTime? get birthDate => throw _privateConstructorUsedError;

  /// Age of child in months when role is newMom / momOfChild
  int get childAgeMonths => throw _privateConstructorUsedError;
  bool get isPremium => throw _privateConstructorUsedError;

  /// Serializes this MotherProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MotherProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MotherProfileCopyWith<MotherProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotherProfileCopyWith<$Res> {
  factory $MotherProfileCopyWith(
    MotherProfile value,
    $Res Function(MotherProfile) then,
  ) = _$MotherProfileCopyWithImpl<$Res, MotherProfile>;
  @useResult
  $Res call({
    String id,
    String firstName,
    String lastName,
    int age,
    int currentWeek,
    DateTime dueDate,
    double weightKg,
    double heightCm,
    String bloodType,
    String? partnerName,
    String role,
    String? avatarUrl,
    DateTime? birthDate,
    int childAgeMonths,
    bool isPremium,
  });
}

/// @nodoc
class _$MotherProfileCopyWithImpl<$Res, $Val extends MotherProfile>
    implements $MotherProfileCopyWith<$Res> {
  _$MotherProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MotherProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? age = null,
    Object? currentWeek = null,
    Object? dueDate = null,
    Object? weightKg = null,
    Object? heightCm = null,
    Object? bloodType = null,
    Object? partnerName = freezed,
    Object? role = null,
    Object? avatarUrl = freezed,
    Object? birthDate = freezed,
    Object? childAgeMonths = null,
    Object? isPremium = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            age: null == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int,
            currentWeek: null == currentWeek
                ? _value.currentWeek
                : currentWeek // ignore: cast_nullable_to_non_nullable
                      as int,
            dueDate: null == dueDate
                ? _value.dueDate
                : dueDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            weightKg: null == weightKg
                ? _value.weightKg
                : weightKg // ignore: cast_nullable_to_non_nullable
                      as double,
            heightCm: null == heightCm
                ? _value.heightCm
                : heightCm // ignore: cast_nullable_to_non_nullable
                      as double,
            bloodType: null == bloodType
                ? _value.bloodType
                : bloodType // ignore: cast_nullable_to_non_nullable
                      as String,
            partnerName: freezed == partnerName
                ? _value.partnerName
                : partnerName // ignore: cast_nullable_to_non_nullable
                      as String?,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            birthDate: freezed == birthDate
                ? _value.birthDate
                : birthDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            childAgeMonths: null == childAgeMonths
                ? _value.childAgeMonths
                : childAgeMonths // ignore: cast_nullable_to_non_nullable
                      as int,
            isPremium: null == isPremium
                ? _value.isPremium
                : isPremium // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MotherProfileImplCopyWith<$Res>
    implements $MotherProfileCopyWith<$Res> {
  factory _$$MotherProfileImplCopyWith(
    _$MotherProfileImpl value,
    $Res Function(_$MotherProfileImpl) then,
  ) = __$$MotherProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String firstName,
    String lastName,
    int age,
    int currentWeek,
    DateTime dueDate,
    double weightKg,
    double heightCm,
    String bloodType,
    String? partnerName,
    String role,
    String? avatarUrl,
    DateTime? birthDate,
    int childAgeMonths,
    bool isPremium,
  });
}

/// @nodoc
class __$$MotherProfileImplCopyWithImpl<$Res>
    extends _$MotherProfileCopyWithImpl<$Res, _$MotherProfileImpl>
    implements _$$MotherProfileImplCopyWith<$Res> {
  __$$MotherProfileImplCopyWithImpl(
    _$MotherProfileImpl _value,
    $Res Function(_$MotherProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MotherProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? age = null,
    Object? currentWeek = null,
    Object? dueDate = null,
    Object? weightKg = null,
    Object? heightCm = null,
    Object? bloodType = null,
    Object? partnerName = freezed,
    Object? role = null,
    Object? avatarUrl = freezed,
    Object? birthDate = freezed,
    Object? childAgeMonths = null,
    Object? isPremium = null,
  }) {
    return _then(
      _$MotherProfileImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        age: null == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int,
        currentWeek: null == currentWeek
            ? _value.currentWeek
            : currentWeek // ignore: cast_nullable_to_non_nullable
                  as int,
        dueDate: null == dueDate
            ? _value.dueDate
            : dueDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        weightKg: null == weightKg
            ? _value.weightKg
            : weightKg // ignore: cast_nullable_to_non_nullable
                  as double,
        heightCm: null == heightCm
            ? _value.heightCm
            : heightCm // ignore: cast_nullable_to_non_nullable
                  as double,
        bloodType: null == bloodType
            ? _value.bloodType
            : bloodType // ignore: cast_nullable_to_non_nullable
                  as String,
        partnerName: freezed == partnerName
            ? _value.partnerName
            : partnerName // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        birthDate: freezed == birthDate
            ? _value.birthDate
            : birthDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        childAgeMonths: null == childAgeMonths
            ? _value.childAgeMonths
            : childAgeMonths // ignore: cast_nullable_to_non_nullable
                  as int,
        isPremium: null == isPremium
            ? _value.isPremium
            : isPremium // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MotherProfileImpl implements _MotherProfile {
  const _$MotherProfileImpl({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.currentWeek,
    required this.dueDate,
    required this.weightKg,
    required this.heightCm,
    required this.bloodType,
    this.partnerName,
    this.role = 'pregnant',
    this.avatarUrl,
    this.birthDate,
    this.childAgeMonths = 0,
    this.isPremium = false,
  });

  factory _$MotherProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$MotherProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final int age;
  @override
  final int currentWeek;
  @override
  final DateTime dueDate;
  @override
  final double weightKg;
  @override
  final double heightCm;
  @override
  final String bloodType;
  @override
  final String? partnerName;

  /// pregnant | newMom | planning | momOfChild
  @override
  @JsonKey()
  final String role;
  @override
  final String? avatarUrl;
  @override
  final DateTime? birthDate;

  /// Age of child in months when role is newMom / momOfChild
  @override
  @JsonKey()
  final int childAgeMonths;
  @override
  @JsonKey()
  final bool isPremium;

  @override
  String toString() {
    return 'MotherProfile(id: $id, firstName: $firstName, lastName: $lastName, age: $age, currentWeek: $currentWeek, dueDate: $dueDate, weightKg: $weightKg, heightCm: $heightCm, bloodType: $bloodType, partnerName: $partnerName, role: $role, avatarUrl: $avatarUrl, birthDate: $birthDate, childAgeMonths: $childAgeMonths, isPremium: $isPremium)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MotherProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.currentWeek, currentWeek) ||
                other.currentWeek == currentWeek) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.bloodType, bloodType) ||
                other.bloodType == bloodType) &&
            (identical(other.partnerName, partnerName) ||
                other.partnerName == partnerName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.childAgeMonths, childAgeMonths) ||
                other.childAgeMonths == childAgeMonths) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    firstName,
    lastName,
    age,
    currentWeek,
    dueDate,
    weightKg,
    heightCm,
    bloodType,
    partnerName,
    role,
    avatarUrl,
    birthDate,
    childAgeMonths,
    isPremium,
  );

  /// Create a copy of MotherProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MotherProfileImplCopyWith<_$MotherProfileImpl> get copyWith =>
      __$$MotherProfileImplCopyWithImpl<_$MotherProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MotherProfileImplToJson(this);
  }
}

abstract class _MotherProfile implements MotherProfile {
  const factory _MotherProfile({
    required final String id,
    required final String firstName,
    required final String lastName,
    required final int age,
    required final int currentWeek,
    required final DateTime dueDate,
    required final double weightKg,
    required final double heightCm,
    required final String bloodType,
    final String? partnerName,
    final String role,
    final String? avatarUrl,
    final DateTime? birthDate,
    final int childAgeMonths,
    final bool isPremium,
  }) = _$MotherProfileImpl;

  factory _MotherProfile.fromJson(Map<String, dynamic> json) =
      _$MotherProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  int get age;
  @override
  int get currentWeek;
  @override
  DateTime get dueDate;
  @override
  double get weightKg;
  @override
  double get heightCm;
  @override
  String get bloodType;
  @override
  String? get partnerName;

  /// pregnant | newMom | planning | momOfChild
  @override
  String get role;
  @override
  String? get avatarUrl;
  @override
  DateTime? get birthDate;

  /// Age of child in months when role is newMom / momOfChild
  @override
  int get childAgeMonths;
  @override
  bool get isPremium;

  /// Create a copy of MotherProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MotherProfileImplCopyWith<_$MotherProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BabyProfile _$BabyProfileFromJson(Map<String, dynamic> json) {
  return _BabyProfile.fromJson(json);
}

/// @nodoc
mixin _$BabyProfile {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get week => throw _privateConstructorUsedError;
  double get weightGrams => throw _privateConstructorUsedError;
  double get lengthCm => throw _privateConstructorUsedError;
  String get fruitComparison => throw _privateConstructorUsedError;
  int get heartbeatBpm => throw _privateConstructorUsedError;
  List<String> get organsDeveloping => throw _privateConstructorUsedError;
  List<String> get milestones => throw _privateConstructorUsedError;

  /// Serializes this BabyProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BabyProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BabyProfileCopyWith<BabyProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyProfileCopyWith<$Res> {
  factory $BabyProfileCopyWith(
    BabyProfile value,
    $Res Function(BabyProfile) then,
  ) = _$BabyProfileCopyWithImpl<$Res, BabyProfile>;
  @useResult
  $Res call({
    String id,
    String name,
    int week,
    double weightGrams,
    double lengthCm,
    String fruitComparison,
    int heartbeatBpm,
    List<String> organsDeveloping,
    List<String> milestones,
  });
}

/// @nodoc
class _$BabyProfileCopyWithImpl<$Res, $Val extends BabyProfile>
    implements $BabyProfileCopyWith<$Res> {
  _$BabyProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BabyProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? week = null,
    Object? weightGrams = null,
    Object? lengthCm = null,
    Object? fruitComparison = null,
    Object? heartbeatBpm = null,
    Object? organsDeveloping = null,
    Object? milestones = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            week: null == week
                ? _value.week
                : week // ignore: cast_nullable_to_non_nullable
                      as int,
            weightGrams: null == weightGrams
                ? _value.weightGrams
                : weightGrams // ignore: cast_nullable_to_non_nullable
                      as double,
            lengthCm: null == lengthCm
                ? _value.lengthCm
                : lengthCm // ignore: cast_nullable_to_non_nullable
                      as double,
            fruitComparison: null == fruitComparison
                ? _value.fruitComparison
                : fruitComparison // ignore: cast_nullable_to_non_nullable
                      as String,
            heartbeatBpm: null == heartbeatBpm
                ? _value.heartbeatBpm
                : heartbeatBpm // ignore: cast_nullable_to_non_nullable
                      as int,
            organsDeveloping: null == organsDeveloping
                ? _value.organsDeveloping
                : organsDeveloping // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            milestones: null == milestones
                ? _value.milestones
                : milestones // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BabyProfileImplCopyWith<$Res>
    implements $BabyProfileCopyWith<$Res> {
  factory _$$BabyProfileImplCopyWith(
    _$BabyProfileImpl value,
    $Res Function(_$BabyProfileImpl) then,
  ) = __$$BabyProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    int week,
    double weightGrams,
    double lengthCm,
    String fruitComparison,
    int heartbeatBpm,
    List<String> organsDeveloping,
    List<String> milestones,
  });
}

/// @nodoc
class __$$BabyProfileImplCopyWithImpl<$Res>
    extends _$BabyProfileCopyWithImpl<$Res, _$BabyProfileImpl>
    implements _$$BabyProfileImplCopyWith<$Res> {
  __$$BabyProfileImplCopyWithImpl(
    _$BabyProfileImpl _value,
    $Res Function(_$BabyProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BabyProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? week = null,
    Object? weightGrams = null,
    Object? lengthCm = null,
    Object? fruitComparison = null,
    Object? heartbeatBpm = null,
    Object? organsDeveloping = null,
    Object? milestones = null,
  }) {
    return _then(
      _$BabyProfileImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        week: null == week
            ? _value.week
            : week // ignore: cast_nullable_to_non_nullable
                  as int,
        weightGrams: null == weightGrams
            ? _value.weightGrams
            : weightGrams // ignore: cast_nullable_to_non_nullable
                  as double,
        lengthCm: null == lengthCm
            ? _value.lengthCm
            : lengthCm // ignore: cast_nullable_to_non_nullable
                  as double,
        fruitComparison: null == fruitComparison
            ? _value.fruitComparison
            : fruitComparison // ignore: cast_nullable_to_non_nullable
                  as String,
        heartbeatBpm: null == heartbeatBpm
            ? _value.heartbeatBpm
            : heartbeatBpm // ignore: cast_nullable_to_non_nullable
                  as int,
        organsDeveloping: null == organsDeveloping
            ? _value._organsDeveloping
            : organsDeveloping // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        milestones: null == milestones
            ? _value._milestones
            : milestones // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BabyProfileImpl implements _BabyProfile {
  const _$BabyProfileImpl({
    required this.id,
    this.name = '',
    required this.week,
    required this.weightGrams,
    required this.lengthCm,
    required this.fruitComparison,
    required this.heartbeatBpm,
    final List<String> organsDeveloping = const <String>[],
    final List<String> milestones = const <String>[],
  }) : _organsDeveloping = organsDeveloping,
       _milestones = milestones;

  factory _$BabyProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$BabyProfileImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  final int week;
  @override
  final double weightGrams;
  @override
  final double lengthCm;
  @override
  final String fruitComparison;
  @override
  final int heartbeatBpm;
  final List<String> _organsDeveloping;
  @override
  @JsonKey()
  List<String> get organsDeveloping {
    if (_organsDeveloping is EqualUnmodifiableListView)
      return _organsDeveloping;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organsDeveloping);
  }

  final List<String> _milestones;
  @override
  @JsonKey()
  List<String> get milestones {
    if (_milestones is EqualUnmodifiableListView) return _milestones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_milestones);
  }

  @override
  String toString() {
    return 'BabyProfile(id: $id, name: $name, week: $week, weightGrams: $weightGrams, lengthCm: $lengthCm, fruitComparison: $fruitComparison, heartbeatBpm: $heartbeatBpm, organsDeveloping: $organsDeveloping, milestones: $milestones)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BabyProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.weightGrams, weightGrams) ||
                other.weightGrams == weightGrams) &&
            (identical(other.lengthCm, lengthCm) ||
                other.lengthCm == lengthCm) &&
            (identical(other.fruitComparison, fruitComparison) ||
                other.fruitComparison == fruitComparison) &&
            (identical(other.heartbeatBpm, heartbeatBpm) ||
                other.heartbeatBpm == heartbeatBpm) &&
            const DeepCollectionEquality().equals(
              other._organsDeveloping,
              _organsDeveloping,
            ) &&
            const DeepCollectionEquality().equals(
              other._milestones,
              _milestones,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    week,
    weightGrams,
    lengthCm,
    fruitComparison,
    heartbeatBpm,
    const DeepCollectionEquality().hash(_organsDeveloping),
    const DeepCollectionEquality().hash(_milestones),
  );

  /// Create a copy of BabyProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BabyProfileImplCopyWith<_$BabyProfileImpl> get copyWith =>
      __$$BabyProfileImplCopyWithImpl<_$BabyProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BabyProfileImplToJson(this);
  }
}

abstract class _BabyProfile implements BabyProfile {
  const factory _BabyProfile({
    required final String id,
    final String name,
    required final int week,
    required final double weightGrams,
    required final double lengthCm,
    required final String fruitComparison,
    required final int heartbeatBpm,
    final List<String> organsDeveloping,
    final List<String> milestones,
  }) = _$BabyProfileImpl;

  factory _BabyProfile.fromJson(Map<String, dynamic> json) =
      _$BabyProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get week;
  @override
  double get weightGrams;
  @override
  double get lengthCm;
  @override
  String get fruitComparison;
  @override
  int get heartbeatBpm;
  @override
  List<String> get organsDeveloping;
  @override
  List<String> get milestones;

  /// Create a copy of BabyProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BabyProfileImplCopyWith<_$BabyProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
