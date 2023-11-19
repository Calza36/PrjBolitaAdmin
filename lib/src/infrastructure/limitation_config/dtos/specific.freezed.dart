// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'specific.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Specific _$SpecificFromJson(Map<String, dynamic> json) {
  return _Specific.fromJson(json);
}

/// @nodoc
mixin _$Specific {
  String? get id => throw _privateConstructorUsedError;
  List<String>? get numbers => throw _privateConstructorUsedError;
  List<String>? get parlets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecificCopyWith<Specific> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecificCopyWith<$Res> {
  factory $SpecificCopyWith(Specific value, $Res Function(Specific) then) =
      _$SpecificCopyWithImpl<$Res, Specific>;
  @useResult
  $Res call({String? id, List<String>? numbers, List<String>? parlets});
}

/// @nodoc
class _$SpecificCopyWithImpl<$Res, $Val extends Specific>
    implements $SpecificCopyWith<$Res> {
  _$SpecificCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? numbers = freezed,
    Object? parlets = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$_SpecificCopyWith<$Res> implements $SpecificCopyWith<$Res> {
  factory _$$_SpecificCopyWith(
          _$_Specific value, $Res Function(_$_Specific) then) =
      __$$_SpecificCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, List<String>? numbers, List<String>? parlets});
}

/// @nodoc
class __$$_SpecificCopyWithImpl<$Res>
    extends _$SpecificCopyWithImpl<$Res, _$_Specific>
    implements _$$_SpecificCopyWith<$Res> {
  __$$_SpecificCopyWithImpl(
      _$_Specific _value, $Res Function(_$_Specific) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? numbers = freezed,
    Object? parlets = freezed,
  }) {
    return _then(_$_Specific(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$_Specific implements _Specific {
  const _$_Specific(
      {this.id, final List<String>? numbers, final List<String>? parlets})
      : _numbers = numbers,
        _parlets = parlets;

  factory _$_Specific.fromJson(Map<String, dynamic> json) =>
      _$$_SpecificFromJson(json);

  @override
  final String? id;
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
    return 'Specific(id: $id, numbers: $numbers, parlets: $parlets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Specific &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            const DeepCollectionEquality().equals(other._parlets, _parlets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_numbers),
      const DeepCollectionEquality().hash(_parlets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpecificCopyWith<_$_Specific> get copyWith =>
      __$$_SpecificCopyWithImpl<_$_Specific>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpecificToJson(
      this,
    );
  }
}

abstract class _Specific implements Specific {
  const factory _Specific(
      {final String? id,
      final List<String>? numbers,
      final List<String>? parlets}) = _$_Specific;

  factory _Specific.fromJson(Map<String, dynamic> json) = _$_Specific.fromJson;

  @override
  String? get id;
  @override
  List<String>? get numbers;
  @override
  List<String>? get parlets;
  @override
  @JsonKey(ignore: true)
  _$$_SpecificCopyWith<_$_Specific> get copyWith =>
      throw _privateConstructorUsedError;
}
