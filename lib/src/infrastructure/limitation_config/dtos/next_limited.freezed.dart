// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'next_limited.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NextLimited _$NextLimitedFromJson(Map<String, dynamic> json) {
  return _NextLimited.fromJson(json);
}

/// @nodoc
mixin _$NextLimited {
  Limited? get dayLimited => throw _privateConstructorUsedError;
  Limited? get nightLimited => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NextLimitedCopyWith<NextLimited> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NextLimitedCopyWith<$Res> {
  factory $NextLimitedCopyWith(
          NextLimited value, $Res Function(NextLimited) then) =
      _$NextLimitedCopyWithImpl<$Res, NextLimited>;
  @useResult
  $Res call({Limited? dayLimited, Limited? nightLimited});

  $LimitedCopyWith<$Res>? get dayLimited;
  $LimitedCopyWith<$Res>? get nightLimited;
}

/// @nodoc
class _$NextLimitedCopyWithImpl<$Res, $Val extends NextLimited>
    implements $NextLimitedCopyWith<$Res> {
  _$NextLimitedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayLimited = freezed,
    Object? nightLimited = freezed,
  }) {
    return _then(_value.copyWith(
      dayLimited: freezed == dayLimited
          ? _value.dayLimited
          : dayLimited // ignore: cast_nullable_to_non_nullable
              as Limited?,
      nightLimited: freezed == nightLimited
          ? _value.nightLimited
          : nightLimited // ignore: cast_nullable_to_non_nullable
              as Limited?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LimitedCopyWith<$Res>? get dayLimited {
    if (_value.dayLimited == null) {
      return null;
    }

    return $LimitedCopyWith<$Res>(_value.dayLimited!, (value) {
      return _then(_value.copyWith(dayLimited: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LimitedCopyWith<$Res>? get nightLimited {
    if (_value.nightLimited == null) {
      return null;
    }

    return $LimitedCopyWith<$Res>(_value.nightLimited!, (value) {
      return _then(_value.copyWith(nightLimited: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NextLimitedCopyWith<$Res>
    implements $NextLimitedCopyWith<$Res> {
  factory _$$_NextLimitedCopyWith(
          _$_NextLimited value, $Res Function(_$_NextLimited) then) =
      __$$_NextLimitedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Limited? dayLimited, Limited? nightLimited});

  @override
  $LimitedCopyWith<$Res>? get dayLimited;
  @override
  $LimitedCopyWith<$Res>? get nightLimited;
}

/// @nodoc
class __$$_NextLimitedCopyWithImpl<$Res>
    extends _$NextLimitedCopyWithImpl<$Res, _$_NextLimited>
    implements _$$_NextLimitedCopyWith<$Res> {
  __$$_NextLimitedCopyWithImpl(
      _$_NextLimited _value, $Res Function(_$_NextLimited) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayLimited = freezed,
    Object? nightLimited = freezed,
  }) {
    return _then(_$_NextLimited(
      dayLimited: freezed == dayLimited
          ? _value.dayLimited
          : dayLimited // ignore: cast_nullable_to_non_nullable
              as Limited?,
      nightLimited: freezed == nightLimited
          ? _value.nightLimited
          : nightLimited // ignore: cast_nullable_to_non_nullable
              as Limited?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NextLimited implements _NextLimited {
  const _$_NextLimited({this.dayLimited, this.nightLimited});

  factory _$_NextLimited.fromJson(Map<String, dynamic> json) =>
      _$$_NextLimitedFromJson(json);

  @override
  final Limited? dayLimited;
  @override
  final Limited? nightLimited;

  @override
  String toString() {
    return 'NextLimited(dayLimited: $dayLimited, nightLimited: $nightLimited)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NextLimited &&
            (identical(other.dayLimited, dayLimited) ||
                other.dayLimited == dayLimited) &&
            (identical(other.nightLimited, nightLimited) ||
                other.nightLimited == nightLimited));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dayLimited, nightLimited);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NextLimitedCopyWith<_$_NextLimited> get copyWith =>
      __$$_NextLimitedCopyWithImpl<_$_NextLimited>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NextLimitedToJson(
      this,
    );
  }
}

abstract class _NextLimited implements NextLimited {
  const factory _NextLimited(
      {final Limited? dayLimited,
      final Limited? nightLimited}) = _$_NextLimited;

  factory _NextLimited.fromJson(Map<String, dynamic> json) =
      _$_NextLimited.fromJson;

  @override
  Limited? get dayLimited;
  @override
  Limited? get nightLimited;
  @override
  @JsonKey(ignore: true)
  _$$_NextLimitedCopyWith<_$_NextLimited> get copyWith =>
      throw _privateConstructorUsedError;
}

Limited _$LimitedFromJson(Map<String, dynamic> json) {
  return _Limited.fromJson(json);
}

/// @nodoc
mixin _$Limited {
  List<String>? get numbers => throw _privateConstructorUsedError;
  List<String>? get parlets => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LimitedCopyWith<Limited> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LimitedCopyWith<$Res> {
  factory $LimitedCopyWith(Limited value, $Res Function(Limited) then) =
      _$LimitedCopyWithImpl<$Res, Limited>;
  @useResult
  $Res call({List<String>? numbers, List<String>? parlets, String? id});
}

/// @nodoc
class _$LimitedCopyWithImpl<$Res, $Val extends Limited>
    implements $LimitedCopyWith<$Res> {
  _$LimitedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = freezed,
    Object? parlets = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      numbers: freezed == numbers
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      parlets: freezed == parlets
          ? _value.parlets
          : parlets // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LimitedCopyWith<$Res> implements $LimitedCopyWith<$Res> {
  factory _$$_LimitedCopyWith(
          _$_Limited value, $Res Function(_$_Limited) then) =
      __$$_LimitedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String>? numbers, List<String>? parlets, String? id});
}

/// @nodoc
class __$$_LimitedCopyWithImpl<$Res>
    extends _$LimitedCopyWithImpl<$Res, _$_Limited>
    implements _$$_LimitedCopyWith<$Res> {
  __$$_LimitedCopyWithImpl(_$_Limited _value, $Res Function(_$_Limited) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = freezed,
    Object? parlets = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_Limited(
      numbers: freezed == numbers
          ? _value._numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      parlets: freezed == parlets
          ? _value._parlets
          : parlets // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Limited implements _Limited {
  const _$_Limited(
      {final List<String>? numbers, final List<String>? parlets, this.id})
      : _numbers = numbers,
        _parlets = parlets;

  factory _$_Limited.fromJson(Map<String, dynamic> json) =>
      _$$_LimitedFromJson(json);

  final List<String>? _numbers;
  @override
  List<String>? get numbers {
    final value = _numbers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _parlets;
  @override
  List<String>? get parlets {
    final value = _parlets;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? id;

  @override
  String toString() {
    return 'Limited(numbers: $numbers, parlets: $parlets, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Limited &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            const DeepCollectionEquality().equals(other._parlets, _parlets) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_numbers),
      const DeepCollectionEquality().hash(_parlets),
      id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LimitedCopyWith<_$_Limited> get copyWith =>
      __$$_LimitedCopyWithImpl<_$_Limited>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LimitedToJson(
      this,
    );
  }
}

abstract class _Limited implements Limited {
  const factory _Limited(
      {final List<String>? numbers,
      final List<String>? parlets,
      final String? id}) = _$_Limited;

  factory _Limited.fromJson(Map<String, dynamic> json) = _$_Limited.fromJson;

  @override
  List<String>? get numbers;
  @override
  List<String>? get parlets;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_LimitedCopyWith<_$_Limited> get copyWith =>
      throw _privateConstructorUsedError;
}
