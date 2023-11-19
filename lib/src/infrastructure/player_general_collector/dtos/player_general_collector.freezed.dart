// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player_general_collector.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlayerGeneralCollector _$PlayerGeneralCollectorFromJson(
    Map<String, dynamic> json) {
  return _PlayerGeneralCollector.fromJson(json);
}

/// @nodoc
mixin _$PlayerGeneralCollector {
  List<GeneralCollector>? get generalCollectors =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerGeneralCollectorCopyWith<PlayerGeneralCollector> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerGeneralCollectorCopyWith<$Res> {
  factory $PlayerGeneralCollectorCopyWith(PlayerGeneralCollector value,
          $Res Function(PlayerGeneralCollector) then) =
      _$PlayerGeneralCollectorCopyWithImpl<$Res, PlayerGeneralCollector>;
  @useResult
  $Res call({List<GeneralCollector>? generalCollectors});
}

/// @nodoc
class _$PlayerGeneralCollectorCopyWithImpl<$Res,
        $Val extends PlayerGeneralCollector>
    implements $PlayerGeneralCollectorCopyWith<$Res> {
  _$PlayerGeneralCollectorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generalCollectors = freezed,
  }) {
    return _then(_value.copyWith(
      generalCollectors: freezed == generalCollectors
          ? _value.generalCollectors
          : generalCollectors // ignore: cast_nullable_to_non_nullable
              as List<GeneralCollector>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayerGeneralCollectorCopyWith<$Res>
    implements $PlayerGeneralCollectorCopyWith<$Res> {
  factory _$$_PlayerGeneralCollectorCopyWith(_$_PlayerGeneralCollector value,
          $Res Function(_$_PlayerGeneralCollector) then) =
      __$$_PlayerGeneralCollectorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GeneralCollector>? generalCollectors});
}

/// @nodoc
class __$$_PlayerGeneralCollectorCopyWithImpl<$Res>
    extends _$PlayerGeneralCollectorCopyWithImpl<$Res,
        _$_PlayerGeneralCollector>
    implements _$$_PlayerGeneralCollectorCopyWith<$Res> {
  __$$_PlayerGeneralCollectorCopyWithImpl(_$_PlayerGeneralCollector _value,
      $Res Function(_$_PlayerGeneralCollector) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generalCollectors = freezed,
  }) {
    return _then(_$_PlayerGeneralCollector(
      generalCollectors: freezed == generalCollectors
          ? _value._generalCollectors
          : generalCollectors // ignore: cast_nullable_to_non_nullable
              as List<GeneralCollector>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlayerGeneralCollector implements _PlayerGeneralCollector {
  const _$_PlayerGeneralCollector(
      {final List<GeneralCollector>? generalCollectors})
      : _generalCollectors = generalCollectors;

  factory _$_PlayerGeneralCollector.fromJson(Map<String, dynamic> json) =>
      _$$_PlayerGeneralCollectorFromJson(json);

  final List<GeneralCollector>? _generalCollectors;
  @override
  List<GeneralCollector>? get generalCollectors {
    final value = _generalCollectors;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PlayerGeneralCollector(generalCollectors: $generalCollectors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerGeneralCollector &&
            const DeepCollectionEquality()
                .equals(other._generalCollectors, _generalCollectors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_generalCollectors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerGeneralCollectorCopyWith<_$_PlayerGeneralCollector> get copyWith =>
      __$$_PlayerGeneralCollectorCopyWithImpl<_$_PlayerGeneralCollector>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayerGeneralCollectorToJson(
      this,
    );
  }
}

abstract class _PlayerGeneralCollector implements PlayerGeneralCollector {
  const factory _PlayerGeneralCollector(
          {final List<GeneralCollector>? generalCollectors}) =
      _$_PlayerGeneralCollector;

  factory _PlayerGeneralCollector.fromJson(Map<String, dynamic> json) =
      _$_PlayerGeneralCollector.fromJson;

  @override
  List<GeneralCollector>? get generalCollectors;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerGeneralCollectorCopyWith<_$_PlayerGeneralCollector> get copyWith =>
      throw _privateConstructorUsedError;
}

GeneralCollector _$GeneralCollectorFromJson(Map<String, dynamic> json) {
  return _GeneralCollector.fromJson(json);
}

/// @nodoc
mixin _$GeneralCollector {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get userType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeneralCollectorCopyWith<GeneralCollector> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralCollectorCopyWith<$Res> {
  factory $GeneralCollectorCopyWith(
          GeneralCollector value, $Res Function(GeneralCollector) then) =
      _$GeneralCollectorCopyWithImpl<$Res, GeneralCollector>;
  @useResult
  $Res call({String? id, String? name, String? status, String? userType});
}

/// @nodoc
class _$GeneralCollectorCopyWithImpl<$Res, $Val extends GeneralCollector>
    implements $GeneralCollectorCopyWith<$Res> {
  _$GeneralCollectorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? userType = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeneralCollectorCopyWith<$Res>
    implements $GeneralCollectorCopyWith<$Res> {
  factory _$$_GeneralCollectorCopyWith(
          _$_GeneralCollector value, $Res Function(_$_GeneralCollector) then) =
      __$$_GeneralCollectorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, String? status, String? userType});
}

/// @nodoc
class __$$_GeneralCollectorCopyWithImpl<$Res>
    extends _$GeneralCollectorCopyWithImpl<$Res, _$_GeneralCollector>
    implements _$$_GeneralCollectorCopyWith<$Res> {
  __$$_GeneralCollectorCopyWithImpl(
      _$_GeneralCollector _value, $Res Function(_$_GeneralCollector) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? userType = freezed,
  }) {
    return _then(_$_GeneralCollector(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeneralCollector implements _GeneralCollector {
  const _$_GeneralCollector({this.id, this.name, this.status, this.userType});

  factory _$_GeneralCollector.fromJson(Map<String, dynamic> json) =>
      _$$_GeneralCollectorFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? status;
  @override
  final String? userType;

  @override
  String toString() {
    return 'GeneralCollector(id: $id, name: $name, status: $status, userType: $userType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeneralCollector &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userType, userType) ||
                other.userType == userType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, status, userType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeneralCollectorCopyWith<_$_GeneralCollector> get copyWith =>
      __$$_GeneralCollectorCopyWithImpl<_$_GeneralCollector>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeneralCollectorToJson(
      this,
    );
  }
}

abstract class _GeneralCollector implements GeneralCollector {
  const factory _GeneralCollector(
      {final String? id,
      final String? name,
      final String? status,
      final String? userType}) = _$_GeneralCollector;

  factory _GeneralCollector.fromJson(Map<String, dynamic> json) =
      _$_GeneralCollector.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get status;
  @override
  String? get userType;
  @override
  @JsonKey(ignore: true)
  _$$_GeneralCollectorCopyWith<_$_GeneralCollector> get copyWith =>
      throw _privateConstructorUsedError;
}
