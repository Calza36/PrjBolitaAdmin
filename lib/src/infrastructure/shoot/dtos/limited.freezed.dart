// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'limited.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Limited _$LimitedFromJson(Map<String, dynamic> json) {
  return _Limited.fromJson(json);
}

/// @nodoc
mixin _$Limited {
  String? get id => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  List<String>? get numbers => throw _privateConstructorUsedError;
  List<String>? get parlets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LimitedCopyWith<Limited> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LimitedCopyWith<$Res> {
  factory $LimitedCopyWith(Limited value, $Res Function(Limited) then) =
      _$LimitedCopyWithImpl<$Res, Limited>;
  @useResult
  $Res call(
      {String? id,
      bool? isActive,
      List<String>? numbers,
      List<String>? parlets});
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
    Object? id = freezed,
    Object? isActive = freezed,
    Object? numbers = freezed,
    Object? parlets = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      numbers: freezed == numbers
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      parlets: freezed == parlets
          ? _value.parlets
          : parlets // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
  $Res call(
      {String? id,
      bool? isActive,
      List<String>? numbers,
      List<String>? parlets});
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
    Object? id = freezed,
    Object? isActive = freezed,
    Object? numbers = freezed,
    Object? parlets = freezed,
  }) {
    return _then(_$_Limited(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      numbers: freezed == numbers
          ? _value._numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      parlets: freezed == parlets
          ? _value._parlets
          : parlets // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Limited implements _Limited {
  const _$_Limited(
      {this.id,
      this.isActive,
      final List<String>? numbers,
      final List<String>? parlets})
      : _numbers = numbers,
        _parlets = parlets;

  factory _$_Limited.fromJson(Map<String, dynamic> json) =>
      _$$_LimitedFromJson(json);

  @override
  final String? id;
  @override
  final bool? isActive;
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
  String toString() {
    return 'Limited(id: $id, isActive: $isActive, numbers: $numbers, parlets: $parlets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Limited &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            const DeepCollectionEquality().equals(other._parlets, _parlets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isActive,
      const DeepCollectionEquality().hash(_numbers),
      const DeepCollectionEquality().hash(_parlets));

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
      {final String? id,
      final bool? isActive,
      final List<String>? numbers,
      final List<String>? parlets}) = _$_Limited;

  factory _Limited.fromJson(Map<String, dynamic> json) = _$_Limited.fromJson;

  @override
  String? get id;
  @override
  bool? get isActive;
  @override
  List<String>? get numbers;
  @override
  List<String>? get parlets;
  @override
  @JsonKey(ignore: true)
  _$$_LimitedCopyWith<_$_Limited> get copyWith =>
      throw _privateConstructorUsedError;
}
