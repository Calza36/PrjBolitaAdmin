// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player_foot_collector.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlayerFootCollector _$PlayerFootCollectorFromJson(Map<String, dynamic> json) {
  return _PlayerFootCollector.fromJson(json);
}

/// @nodoc
mixin _$PlayerFootCollector {
  List<FootCollector>? get footCollectors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerFootCollectorCopyWith<PlayerFootCollector> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerFootCollectorCopyWith<$Res> {
  factory $PlayerFootCollectorCopyWith(
          PlayerFootCollector value, $Res Function(PlayerFootCollector) then) =
      _$PlayerFootCollectorCopyWithImpl<$Res, PlayerFootCollector>;
  @useResult
  $Res call({List<FootCollector>? footCollectors});
}

/// @nodoc
class _$PlayerFootCollectorCopyWithImpl<$Res, $Val extends PlayerFootCollector>
    implements $PlayerFootCollectorCopyWith<$Res> {
  _$PlayerFootCollectorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? footCollectors = freezed,
  }) {
    return _then(_value.copyWith(
      footCollectors: freezed == footCollectors
          ? _value.footCollectors
          : footCollectors // ignore: cast_nullable_to_non_nullable
              as List<FootCollector>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayerFootCollectorCopyWith<$Res>
    implements $PlayerFootCollectorCopyWith<$Res> {
  factory _$$_PlayerFootCollectorCopyWith(_$_PlayerFootCollector value,
          $Res Function(_$_PlayerFootCollector) then) =
      __$$_PlayerFootCollectorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FootCollector>? footCollectors});
}

/// @nodoc
class __$$_PlayerFootCollectorCopyWithImpl<$Res>
    extends _$PlayerFootCollectorCopyWithImpl<$Res, _$_PlayerFootCollector>
    implements _$$_PlayerFootCollectorCopyWith<$Res> {
  __$$_PlayerFootCollectorCopyWithImpl(_$_PlayerFootCollector _value,
      $Res Function(_$_PlayerFootCollector) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? footCollectors = freezed,
  }) {
    return _then(_$_PlayerFootCollector(
      footCollectors: freezed == footCollectors
          ? _value._footCollectors
          : footCollectors // ignore: cast_nullable_to_non_nullable
              as List<FootCollector>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlayerFootCollector implements _PlayerFootCollector {
  const _$_PlayerFootCollector({final List<FootCollector>? footCollectors})
      : _footCollectors = footCollectors;

  factory _$_PlayerFootCollector.fromJson(Map<String, dynamic> json) =>
      _$$_PlayerFootCollectorFromJson(json);

  final List<FootCollector>? _footCollectors;
  @override
  List<FootCollector>? get footCollectors {
    final value = _footCollectors;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PlayerFootCollector(footCollectors: $footCollectors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerFootCollector &&
            const DeepCollectionEquality()
                .equals(other._footCollectors, _footCollectors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_footCollectors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerFootCollectorCopyWith<_$_PlayerFootCollector> get copyWith =>
      __$$_PlayerFootCollectorCopyWithImpl<_$_PlayerFootCollector>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayerFootCollectorToJson(
      this,
    );
  }
}

abstract class _PlayerFootCollector implements PlayerFootCollector {
  const factory _PlayerFootCollector(
      {final List<FootCollector>? footCollectors}) = _$_PlayerFootCollector;

  factory _PlayerFootCollector.fromJson(Map<String, dynamic> json) =
      _$_PlayerFootCollector.fromJson;

  @override
  List<FootCollector>? get footCollectors;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerFootCollectorCopyWith<_$_PlayerFootCollector> get copyWith =>
      throw _privateConstructorUsedError;
}

FootCollector _$FootCollectorFromJson(Map<String, dynamic> json) {
  return _FootCollector.fromJson(json);
}

/// @nodoc
mixin _$FootCollector {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get key => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get userType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FootCollectorCopyWith<FootCollector> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FootCollectorCopyWith<$Res> {
  factory $FootCollectorCopyWith(
          FootCollector value, $Res Function(FootCollector) then) =
      _$FootCollectorCopyWithImpl<$Res, FootCollector>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? key,
      String? status,
      String? userType});
}

/// @nodoc
class _$FootCollectorCopyWithImpl<$Res, $Val extends FootCollector>
    implements $FootCollectorCopyWith<$Res> {
  _$FootCollectorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? key = freezed,
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
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_FootCollectorCopyWith<$Res>
    implements $FootCollectorCopyWith<$Res> {
  factory _$$_FootCollectorCopyWith(
          _$_FootCollector value, $Res Function(_$_FootCollector) then) =
      __$$_FootCollectorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? key,
      String? status,
      String? userType});
}

/// @nodoc
class __$$_FootCollectorCopyWithImpl<$Res>
    extends _$FootCollectorCopyWithImpl<$Res, _$_FootCollector>
    implements _$$_FootCollectorCopyWith<$Res> {
  __$$_FootCollectorCopyWithImpl(
      _$_FootCollector _value, $Res Function(_$_FootCollector) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? key = freezed,
    Object? status = freezed,
    Object? userType = freezed,
  }) {
    return _then(_$_FootCollector(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
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
class _$_FootCollector implements _FootCollector {
  const _$_FootCollector(
      {this.id, this.name, this.key, this.status, this.userType});

  factory _$_FootCollector.fromJson(Map<String, dynamic> json) =>
      _$$_FootCollectorFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? key;
  @override
  final String? status;
  @override
  final String? userType;

  @override
  String toString() {
    return 'FootCollector(id: $id, name: $name, key: $key, status: $status, userType: $userType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FootCollector &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userType, userType) ||
                other.userType == userType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, key, status, userType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FootCollectorCopyWith<_$_FootCollector> get copyWith =>
      __$$_FootCollectorCopyWithImpl<_$_FootCollector>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FootCollectorToJson(
      this,
    );
  }
}

abstract class _FootCollector implements FootCollector {
  const factory _FootCollector(
      {final String? id,
      final String? name,
      final String? key,
      final String? status,
      final String? userType}) = _$_FootCollector;

  factory _FootCollector.fromJson(Map<String, dynamic> json) =
      _$_FootCollector.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get key;
  @override
  String? get status;
  @override
  String? get userType;
  @override
  @JsonKey(ignore: true)
  _$$_FootCollectorCopyWith<_$_FootCollector> get copyWith =>
      throw _privateConstructorUsedError;
}
