// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player_collector.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlayerCollector _$PlayerCollectorFromJson(Map<String, dynamic> json) {
  return _PlayerCollector.fromJson(json);
}

/// @nodoc
mixin _$PlayerCollector {
  List<Collector>? get collectors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerCollectorCopyWith<PlayerCollector> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCollectorCopyWith<$Res> {
  factory $PlayerCollectorCopyWith(
          PlayerCollector value, $Res Function(PlayerCollector) then) =
      _$PlayerCollectorCopyWithImpl<$Res, PlayerCollector>;
  @useResult
  $Res call({List<Collector>? collectors});
}

/// @nodoc
class _$PlayerCollectorCopyWithImpl<$Res, $Val extends PlayerCollector>
    implements $PlayerCollectorCopyWith<$Res> {
  _$PlayerCollectorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectors = freezed,
  }) {
    return _then(_value.copyWith(
      collectors: freezed == collectors
          ? _value.collectors
          : collectors // ignore: cast_nullable_to_non_nullable
              as List<Collector>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayerCollectorCopyWith<$Res>
    implements $PlayerCollectorCopyWith<$Res> {
  factory _$$_PlayerCollectorCopyWith(
          _$_PlayerCollector value, $Res Function(_$_PlayerCollector) then) =
      __$$_PlayerCollectorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Collector>? collectors});
}

/// @nodoc
class __$$_PlayerCollectorCopyWithImpl<$Res>
    extends _$PlayerCollectorCopyWithImpl<$Res, _$_PlayerCollector>
    implements _$$_PlayerCollectorCopyWith<$Res> {
  __$$_PlayerCollectorCopyWithImpl(
      _$_PlayerCollector _value, $Res Function(_$_PlayerCollector) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectors = freezed,
  }) {
    return _then(_$_PlayerCollector(
      collectors: freezed == collectors
          ? _value._collectors
          : collectors // ignore: cast_nullable_to_non_nullable
              as List<Collector>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlayerCollector implements _PlayerCollector {
  const _$_PlayerCollector({final List<Collector>? collectors})
      : _collectors = collectors;

  factory _$_PlayerCollector.fromJson(Map<String, dynamic> json) =>
      _$$_PlayerCollectorFromJson(json);

  final List<Collector>? _collectors;
  @override
  List<Collector>? get collectors {
    final value = _collectors;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PlayerCollector(collectors: $collectors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerCollector &&
            const DeepCollectionEquality()
                .equals(other._collectors, _collectors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_collectors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerCollectorCopyWith<_$_PlayerCollector> get copyWith =>
      __$$_PlayerCollectorCopyWithImpl<_$_PlayerCollector>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayerCollectorToJson(
      this,
    );
  }
}

abstract class _PlayerCollector implements PlayerCollector {
  const factory _PlayerCollector({final List<Collector>? collectors}) =
      _$_PlayerCollector;

  factory _PlayerCollector.fromJson(Map<String, dynamic> json) =
      _$_PlayerCollector.fromJson;

  @override
  List<Collector>? get collectors;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerCollectorCopyWith<_$_PlayerCollector> get copyWith =>
      throw _privateConstructorUsedError;
}

Collector _$CollectorFromJson(Map<String, dynamic> json) {
  return _Collector.fromJson(json);
}

/// @nodoc
mixin _$Collector {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get key => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get userType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollectorCopyWith<Collector> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectorCopyWith<$Res> {
  factory $CollectorCopyWith(Collector value, $Res Function(Collector) then) =
      _$CollectorCopyWithImpl<$Res, Collector>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? key,
      String? status,
      String? userType});
}

/// @nodoc
class _$CollectorCopyWithImpl<$Res, $Val extends Collector>
    implements $CollectorCopyWith<$Res> {
  _$CollectorCopyWithImpl(this._value, this._then);

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
abstract class _$$_CollectorCopyWith<$Res> implements $CollectorCopyWith<$Res> {
  factory _$$_CollectorCopyWith(
          _$_Collector value, $Res Function(_$_Collector) then) =
      __$$_CollectorCopyWithImpl<$Res>;
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
class __$$_CollectorCopyWithImpl<$Res>
    extends _$CollectorCopyWithImpl<$Res, _$_Collector>
    implements _$$_CollectorCopyWith<$Res> {
  __$$_CollectorCopyWithImpl(
      _$_Collector _value, $Res Function(_$_Collector) _then)
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
    return _then(_$_Collector(
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
class _$_Collector implements _Collector {
  const _$_Collector(
      {this.id, this.name, this.key, this.status, this.userType});

  factory _$_Collector.fromJson(Map<String, dynamic> json) =>
      _$$_CollectorFromJson(json);

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
    return 'Collector(id: $id, name: $name, key: $key, status: $status, userType: $userType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Collector &&
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
  _$$_CollectorCopyWith<_$_Collector> get copyWith =>
      __$$_CollectorCopyWithImpl<_$_Collector>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CollectorToJson(
      this,
    );
  }
}

abstract class _Collector implements Collector {
  const factory _Collector(
      {final String? id,
      final String? name,
      final String? key,
      final String? status,
      final String? userType}) = _$_Collector;

  factory _Collector.fromJson(Map<String, dynamic> json) =
      _$_Collector.fromJson;

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
  _$$_CollectorCopyWith<_$_Collector> get copyWith =>
      throw _privateConstructorUsedError;
}
