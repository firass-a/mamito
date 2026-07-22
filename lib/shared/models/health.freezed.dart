// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MoodEntry _$MoodEntryFromJson(Map<String, dynamic> json) {
  return _MoodEntry.fromJson(json);
}

/// @nodoc
mixin _$MoodEntry {
  String get id => throw _privateConstructorUsedError;
  String get mood => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  int get intensity => throw _privateConstructorUsedError;

  /// Serializes this MoodEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoodEntryCopyWith<MoodEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodEntryCopyWith<$Res> {
  factory $MoodEntryCopyWith(MoodEntry value, $Res Function(MoodEntry) then) =
      _$MoodEntryCopyWithImpl<$Res, MoodEntry>;
  @useResult
  $Res call({
    String id,
    String mood,
    DateTime date,
    String note,
    int intensity,
  });
}

/// @nodoc
class _$MoodEntryCopyWithImpl<$Res, $Val extends MoodEntry>
    implements $MoodEntryCopyWith<$Res> {
  _$MoodEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mood = null,
    Object? date = null,
    Object? note = null,
    Object? intensity = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            mood: null == mood
                ? _value.mood
                : mood // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            note: null == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String,
            intensity: null == intensity
                ? _value.intensity
                : intensity // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MoodEntryImplCopyWith<$Res>
    implements $MoodEntryCopyWith<$Res> {
  factory _$$MoodEntryImplCopyWith(
    _$MoodEntryImpl value,
    $Res Function(_$MoodEntryImpl) then,
  ) = __$$MoodEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String mood,
    DateTime date,
    String note,
    int intensity,
  });
}

/// @nodoc
class __$$MoodEntryImplCopyWithImpl<$Res>
    extends _$MoodEntryCopyWithImpl<$Res, _$MoodEntryImpl>
    implements _$$MoodEntryImplCopyWith<$Res> {
  __$$MoodEntryImplCopyWithImpl(
    _$MoodEntryImpl _value,
    $Res Function(_$MoodEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mood = null,
    Object? date = null,
    Object? note = null,
    Object? intensity = null,
  }) {
    return _then(
      _$MoodEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        mood: null == mood
            ? _value.mood
            : mood // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        note: null == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String,
        intensity: null == intensity
            ? _value.intensity
            : intensity // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MoodEntryImpl implements _MoodEntry {
  const _$MoodEntryImpl({
    required this.id,
    required this.mood,
    required this.date,
    this.note = '',
    this.intensity = 3,
  });

  factory _$MoodEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoodEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String mood;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final String note;
  @override
  @JsonKey()
  final int intensity;

  @override
  String toString() {
    return 'MoodEntry(id: $id, mood: $mood, date: $date, note: $note, intensity: $intensity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.intensity, intensity) ||
                other.intensity == intensity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, mood, date, note, intensity);

  /// Create a copy of MoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoodEntryImplCopyWith<_$MoodEntryImpl> get copyWith =>
      __$$MoodEntryImplCopyWithImpl<_$MoodEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoodEntryImplToJson(this);
  }
}

abstract class _MoodEntry implements MoodEntry {
  const factory _MoodEntry({
    required final String id,
    required final String mood,
    required final DateTime date,
    final String note,
    final int intensity,
  }) = _$MoodEntryImpl;

  factory _MoodEntry.fromJson(Map<String, dynamic> json) =
      _$MoodEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get mood;
  @override
  DateTime get date;
  @override
  String get note;
  @override
  int get intensity;

  /// Create a copy of MoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoodEntryImplCopyWith<_$MoodEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SymptomEntry _$SymptomEntryFromJson(Map<String, dynamic> json) {
  return _SymptomEntry.fromJson(json);
}

/// @nodoc
mixin _$SymptomEntry {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get severity => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;

  /// Serializes this SymptomEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SymptomEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SymptomEntryCopyWith<SymptomEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymptomEntryCopyWith<$Res> {
  factory $SymptomEntryCopyWith(
    SymptomEntry value,
    $Res Function(SymptomEntry) then,
  ) = _$SymptomEntryCopyWithImpl<$Res, SymptomEntry>;
  @useResult
  $Res call({
    String id,
    String name,
    DateTime date,
    String severity,
    String note,
  });
}

/// @nodoc
class _$SymptomEntryCopyWithImpl<$Res, $Val extends SymptomEntry>
    implements $SymptomEntryCopyWith<$Res> {
  _$SymptomEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SymptomEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? date = null,
    Object? severity = null,
    Object? note = null,
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
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            severity: null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as String,
            note: null == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SymptomEntryImplCopyWith<$Res>
    implements $SymptomEntryCopyWith<$Res> {
  factory _$$SymptomEntryImplCopyWith(
    _$SymptomEntryImpl value,
    $Res Function(_$SymptomEntryImpl) then,
  ) = __$$SymptomEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    DateTime date,
    String severity,
    String note,
  });
}

/// @nodoc
class __$$SymptomEntryImplCopyWithImpl<$Res>
    extends _$SymptomEntryCopyWithImpl<$Res, _$SymptomEntryImpl>
    implements _$$SymptomEntryImplCopyWith<$Res> {
  __$$SymptomEntryImplCopyWithImpl(
    _$SymptomEntryImpl _value,
    $Res Function(_$SymptomEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SymptomEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? date = null,
    Object? severity = null,
    Object? note = null,
  }) {
    return _then(
      _$SymptomEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        severity: null == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as String,
        note: null == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SymptomEntryImpl implements _SymptomEntry {
  const _$SymptomEntryImpl({
    required this.id,
    required this.name,
    required this.date,
    this.severity = 'mild',
    this.note = '',
  });

  factory _$SymptomEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SymptomEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final String severity;
  @override
  @JsonKey()
  final String note;

  @override
  String toString() {
    return 'SymptomEntry(id: $id, name: $name, date: $date, severity: $severity, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SymptomEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, date, severity, note);

  /// Create a copy of SymptomEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SymptomEntryImplCopyWith<_$SymptomEntryImpl> get copyWith =>
      __$$SymptomEntryImplCopyWithImpl<_$SymptomEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SymptomEntryImplToJson(this);
  }
}

abstract class _SymptomEntry implements SymptomEntry {
  const factory _SymptomEntry({
    required final String id,
    required final String name,
    required final DateTime date,
    final String severity,
    final String note,
  }) = _$SymptomEntryImpl;

  factory _SymptomEntry.fromJson(Map<String, dynamic> json) =
      _$SymptomEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get date;
  @override
  String get severity;
  @override
  String get note;

  /// Create a copy of SymptomEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SymptomEntryImplCopyWith<_$SymptomEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeightEntry _$WeightEntryFromJson(Map<String, dynamic> json) {
  return _WeightEntry.fromJson(json);
}

/// @nodoc
mixin _$WeightEntry {
  String get id => throw _privateConstructorUsedError;
  double get kg => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;

  /// Serializes this WeightEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeightEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeightEntryCopyWith<WeightEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeightEntryCopyWith<$Res> {
  factory $WeightEntryCopyWith(
    WeightEntry value,
    $Res Function(WeightEntry) then,
  ) = _$WeightEntryCopyWithImpl<$Res, WeightEntry>;
  @useResult
  $Res call({String id, double kg, DateTime date, String note});
}

/// @nodoc
class _$WeightEntryCopyWithImpl<$Res, $Val extends WeightEntry>
    implements $WeightEntryCopyWith<$Res> {
  _$WeightEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeightEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kg = null,
    Object? date = null,
    Object? note = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            kg: null == kg
                ? _value.kg
                : kg // ignore: cast_nullable_to_non_nullable
                      as double,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            note: null == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeightEntryImplCopyWith<$Res>
    implements $WeightEntryCopyWith<$Res> {
  factory _$$WeightEntryImplCopyWith(
    _$WeightEntryImpl value,
    $Res Function(_$WeightEntryImpl) then,
  ) = __$$WeightEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, double kg, DateTime date, String note});
}

/// @nodoc
class __$$WeightEntryImplCopyWithImpl<$Res>
    extends _$WeightEntryCopyWithImpl<$Res, _$WeightEntryImpl>
    implements _$$WeightEntryImplCopyWith<$Res> {
  __$$WeightEntryImplCopyWithImpl(
    _$WeightEntryImpl _value,
    $Res Function(_$WeightEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeightEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kg = null,
    Object? date = null,
    Object? note = null,
  }) {
    return _then(
      _$WeightEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        kg: null == kg
            ? _value.kg
            : kg // ignore: cast_nullable_to_non_nullable
                  as double,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        note: null == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeightEntryImpl implements _WeightEntry {
  const _$WeightEntryImpl({
    required this.id,
    required this.kg,
    required this.date,
    this.note = '',
  });

  factory _$WeightEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeightEntryImplFromJson(json);

  @override
  final String id;
  @override
  final double kg;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final String note;

  @override
  String toString() {
    return 'WeightEntry(id: $id, kg: $kg, date: $date, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeightEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kg, kg) || other.kg == kg) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, kg, date, note);

  /// Create a copy of WeightEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeightEntryImplCopyWith<_$WeightEntryImpl> get copyWith =>
      __$$WeightEntryImplCopyWithImpl<_$WeightEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeightEntryImplToJson(this);
  }
}

abstract class _WeightEntry implements WeightEntry {
  const factory _WeightEntry({
    required final String id,
    required final double kg,
    required final DateTime date,
    final String note,
  }) = _$WeightEntryImpl;

  factory _WeightEntry.fromJson(Map<String, dynamic> json) =
      _$WeightEntryImpl.fromJson;

  @override
  String get id;
  @override
  double get kg;
  @override
  DateTime get date;
  @override
  String get note;

  /// Create a copy of WeightEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeightEntryImplCopyWith<_$WeightEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Medication _$MedicationFromJson(Map<String, dynamic> json) {
  return _Medication.fromJson(json);
}

/// @nodoc
mixin _$Medication {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get dosage => throw _privateConstructorUsedError;
  String get schedule => throw _privateConstructorUsedError;
  bool get takenToday => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  /// Serializes this Medication to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicationCopyWith<Medication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationCopyWith<$Res> {
  factory $MedicationCopyWith(
    Medication value,
    $Res Function(Medication) then,
  ) = _$MedicationCopyWithImpl<$Res, Medication>;
  @useResult
  $Res call({
    String id,
    String name,
    String dosage,
    String schedule,
    bool takenToday,
    bool active,
  });
}

/// @nodoc
class _$MedicationCopyWithImpl<$Res, $Val extends Medication>
    implements $MedicationCopyWith<$Res> {
  _$MedicationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dosage = null,
    Object? schedule = null,
    Object? takenToday = null,
    Object? active = null,
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
            dosage: null == dosage
                ? _value.dosage
                : dosage // ignore: cast_nullable_to_non_nullable
                      as String,
            schedule: null == schedule
                ? _value.schedule
                : schedule // ignore: cast_nullable_to_non_nullable
                      as String,
            takenToday: null == takenToday
                ? _value.takenToday
                : takenToday // ignore: cast_nullable_to_non_nullable
                      as bool,
            active: null == active
                ? _value.active
                : active // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MedicationImplCopyWith<$Res>
    implements $MedicationCopyWith<$Res> {
  factory _$$MedicationImplCopyWith(
    _$MedicationImpl value,
    $Res Function(_$MedicationImpl) then,
  ) = __$$MedicationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String dosage,
    String schedule,
    bool takenToday,
    bool active,
  });
}

/// @nodoc
class __$$MedicationImplCopyWithImpl<$Res>
    extends _$MedicationCopyWithImpl<$Res, _$MedicationImpl>
    implements _$$MedicationImplCopyWith<$Res> {
  __$$MedicationImplCopyWithImpl(
    _$MedicationImpl _value,
    $Res Function(_$MedicationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dosage = null,
    Object? schedule = null,
    Object? takenToday = null,
    Object? active = null,
  }) {
    return _then(
      _$MedicationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        dosage: null == dosage
            ? _value.dosage
            : dosage // ignore: cast_nullable_to_non_nullable
                  as String,
        schedule: null == schedule
            ? _value.schedule
            : schedule // ignore: cast_nullable_to_non_nullable
                  as String,
        takenToday: null == takenToday
            ? _value.takenToday
            : takenToday // ignore: cast_nullable_to_non_nullable
                  as bool,
        active: null == active
            ? _value.active
            : active // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MedicationImpl implements _Medication {
  const _$MedicationImpl({
    required this.id,
    required this.name,
    required this.dosage,
    required this.schedule,
    this.takenToday = false,
    this.active = true,
  });

  factory _$MedicationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicationImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String dosage;
  @override
  final String schedule;
  @override
  @JsonKey()
  final bool takenToday;
  @override
  @JsonKey()
  final bool active;

  @override
  String toString() {
    return 'Medication(id: $id, name: $name, dosage: $dosage, schedule: $schedule, takenToday: $takenToday, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.takenToday, takenToday) ||
                other.takenToday == takenToday) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, dosage, schedule, takenToday, active);

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicationImplCopyWith<_$MedicationImpl> get copyWith =>
      __$$MedicationImplCopyWithImpl<_$MedicationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicationImplToJson(this);
  }
}

abstract class _Medication implements Medication {
  const factory _Medication({
    required final String id,
    required final String name,
    required final String dosage,
    required final String schedule,
    final bool takenToday,
    final bool active,
  }) = _$MedicationImpl;

  factory _Medication.fromJson(Map<String, dynamic> json) =
      _$MedicationImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get dosage;
  @override
  String get schedule;
  @override
  bool get takenToday;
  @override
  bool get active;

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicationImplCopyWith<_$MedicationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HydrationDay _$HydrationDayFromJson(Map<String, dynamic> json) {
  return _HydrationDay.fromJson(json);
}

/// @nodoc
mixin _$HydrationDay {
  DateTime get date => throw _privateConstructorUsedError;
  int get glasses => throw _privateConstructorUsedError;
  int get goal => throw _privateConstructorUsedError;

  /// Serializes this HydrationDay to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HydrationDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HydrationDayCopyWith<HydrationDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HydrationDayCopyWith<$Res> {
  factory $HydrationDayCopyWith(
    HydrationDay value,
    $Res Function(HydrationDay) then,
  ) = _$HydrationDayCopyWithImpl<$Res, HydrationDay>;
  @useResult
  $Res call({DateTime date, int glasses, int goal});
}

/// @nodoc
class _$HydrationDayCopyWithImpl<$Res, $Val extends HydrationDay>
    implements $HydrationDayCopyWith<$Res> {
  _$HydrationDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HydrationDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? glasses = null,
    Object? goal = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            glasses: null == glasses
                ? _value.glasses
                : glasses // ignore: cast_nullable_to_non_nullable
                      as int,
            goal: null == goal
                ? _value.goal
                : goal // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HydrationDayImplCopyWith<$Res>
    implements $HydrationDayCopyWith<$Res> {
  factory _$$HydrationDayImplCopyWith(
    _$HydrationDayImpl value,
    $Res Function(_$HydrationDayImpl) then,
  ) = __$$HydrationDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, int glasses, int goal});
}

/// @nodoc
class __$$HydrationDayImplCopyWithImpl<$Res>
    extends _$HydrationDayCopyWithImpl<$Res, _$HydrationDayImpl>
    implements _$$HydrationDayImplCopyWith<$Res> {
  __$$HydrationDayImplCopyWithImpl(
    _$HydrationDayImpl _value,
    $Res Function(_$HydrationDayImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HydrationDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? glasses = null,
    Object? goal = null,
  }) {
    return _then(
      _$HydrationDayImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        glasses: null == glasses
            ? _value.glasses
            : glasses // ignore: cast_nullable_to_non_nullable
                  as int,
        goal: null == goal
            ? _value.goal
            : goal // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HydrationDayImpl implements _HydrationDay {
  const _$HydrationDayImpl({
    required this.date,
    this.glasses = 0,
    this.goal = 8,
  });

  factory _$HydrationDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$HydrationDayImplFromJson(json);

  @override
  final DateTime date;
  @override
  @JsonKey()
  final int glasses;
  @override
  @JsonKey()
  final int goal;

  @override
  String toString() {
    return 'HydrationDay(date: $date, glasses: $glasses, goal: $goal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HydrationDayImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.glasses, glasses) || other.glasses == glasses) &&
            (identical(other.goal, goal) || other.goal == goal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, glasses, goal);

  /// Create a copy of HydrationDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HydrationDayImplCopyWith<_$HydrationDayImpl> get copyWith =>
      __$$HydrationDayImplCopyWithImpl<_$HydrationDayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HydrationDayImplToJson(this);
  }
}

abstract class _HydrationDay implements HydrationDay {
  const factory _HydrationDay({
    required final DateTime date,
    final int glasses,
    final int goal,
  }) = _$HydrationDayImpl;

  factory _HydrationDay.fromJson(Map<String, dynamic> json) =
      _$HydrationDayImpl.fromJson;

  @override
  DateTime get date;
  @override
  int get glasses;
  @override
  int get goal;

  /// Create a copy of HydrationDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HydrationDayImplCopyWith<_$HydrationDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BabyName _$BabyNameFromJson(Map<String, dynamic> json) {
  return _BabyName.fromJson(json);
}

/// @nodoc
mixin _$BabyName {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get meaning => throw _privateConstructorUsedError;
  String get origin => throw _privateConstructorUsedError;
  bool get favorite => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;

  /// Serializes this BabyName to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BabyName
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BabyNameCopyWith<BabyName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyNameCopyWith<$Res> {
  factory $BabyNameCopyWith(BabyName value, $Res Function(BabyName) then) =
      _$BabyNameCopyWithImpl<$Res, BabyName>;
  @useResult
  $Res call({
    String id,
    String name,
    String meaning,
    String origin,
    bool favorite,
    String gender,
  });
}

/// @nodoc
class _$BabyNameCopyWithImpl<$Res, $Val extends BabyName>
    implements $BabyNameCopyWith<$Res> {
  _$BabyNameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BabyName
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? meaning = null,
    Object? origin = null,
    Object? favorite = null,
    Object? gender = null,
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
            meaning: null == meaning
                ? _value.meaning
                : meaning // ignore: cast_nullable_to_non_nullable
                      as String,
            origin: null == origin
                ? _value.origin
                : origin // ignore: cast_nullable_to_non_nullable
                      as String,
            favorite: null == favorite
                ? _value.favorite
                : favorite // ignore: cast_nullable_to_non_nullable
                      as bool,
            gender: null == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BabyNameImplCopyWith<$Res>
    implements $BabyNameCopyWith<$Res> {
  factory _$$BabyNameImplCopyWith(
    _$BabyNameImpl value,
    $Res Function(_$BabyNameImpl) then,
  ) = __$$BabyNameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String meaning,
    String origin,
    bool favorite,
    String gender,
  });
}

/// @nodoc
class __$$BabyNameImplCopyWithImpl<$Res>
    extends _$BabyNameCopyWithImpl<$Res, _$BabyNameImpl>
    implements _$$BabyNameImplCopyWith<$Res> {
  __$$BabyNameImplCopyWithImpl(
    _$BabyNameImpl _value,
    $Res Function(_$BabyNameImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BabyName
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? meaning = null,
    Object? origin = null,
    Object? favorite = null,
    Object? gender = null,
  }) {
    return _then(
      _$BabyNameImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        meaning: null == meaning
            ? _value.meaning
            : meaning // ignore: cast_nullable_to_non_nullable
                  as String,
        origin: null == origin
            ? _value.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as String,
        favorite: null == favorite
            ? _value.favorite
            : favorite // ignore: cast_nullable_to_non_nullable
                  as bool,
        gender: null == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BabyNameImpl implements _BabyName {
  const _$BabyNameImpl({
    required this.id,
    required this.name,
    required this.meaning,
    required this.origin,
    this.favorite = false,
    this.gender = 'unisex',
  });

  factory _$BabyNameImpl.fromJson(Map<String, dynamic> json) =>
      _$$BabyNameImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String meaning;
  @override
  final String origin;
  @override
  @JsonKey()
  final bool favorite;
  @override
  @JsonKey()
  final String gender;

  @override
  String toString() {
    return 'BabyName(id: $id, name: $name, meaning: $meaning, origin: $origin, favorite: $favorite, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BabyNameImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.meaning, meaning) || other.meaning == meaning) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, meaning, origin, favorite, gender);

  /// Create a copy of BabyName
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BabyNameImplCopyWith<_$BabyNameImpl> get copyWith =>
      __$$BabyNameImplCopyWithImpl<_$BabyNameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BabyNameImplToJson(this);
  }
}

abstract class _BabyName implements BabyName {
  const factory _BabyName({
    required final String id,
    required final String name,
    required final String meaning,
    required final String origin,
    final bool favorite,
    final String gender,
  }) = _$BabyNameImpl;

  factory _BabyName.fromJson(Map<String, dynamic> json) =
      _$BabyNameImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get meaning;
  @override
  String get origin;
  @override
  bool get favorite;
  @override
  String get gender;

  /// Create a copy of BabyName
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BabyNameImplCopyWith<_$BabyNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
