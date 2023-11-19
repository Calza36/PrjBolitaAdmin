// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'childrens_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChildrensDto _$ChildrensDtoFromJson(Map<String, dynamic> json) {
  return _ChildrensDto.fromJson(json);
}

/// @nodoc
mixin _$ChildrensDto {
  List<Child>? get children => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChildrensDtoCopyWith<ChildrensDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChildrensDtoCopyWith<$Res> {
  factory $ChildrensDtoCopyWith(
          ChildrensDto value, $Res Function(ChildrensDto) then) =
      _$ChildrensDtoCopyWithImpl<$Res, ChildrensDto>;
  @useResult
  $Res call({List<Child>? children});
}

/// @nodoc
class _$ChildrensDtoCopyWithImpl<$Res, $Val extends ChildrensDto>
    implements $ChildrensDtoCopyWith<$Res> {
  _$ChildrensDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? children = freezed,
  }) {
    return _then(_value.copyWith(
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Child>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChildrensDtoCopyWith<$Res>
    implements $ChildrensDtoCopyWith<$Res> {
  factory _$$_ChildrensDtoCopyWith(
          _$_ChildrensDto value, $Res Function(_$_ChildrensDto) then) =
      __$$_ChildrensDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Child>? children});
}

/// @nodoc
class __$$_ChildrensDtoCopyWithImpl<$Res>
    extends _$ChildrensDtoCopyWithImpl<$Res, _$_ChildrensDto>
    implements _$$_ChildrensDtoCopyWith<$Res> {
  __$$_ChildrensDtoCopyWithImpl(
      _$_ChildrensDto _value, $Res Function(_$_ChildrensDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? children = freezed,
  }) {
    return _then(_$_ChildrensDto(
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Child>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChildrensDto implements _ChildrensDto {
  const _$_ChildrensDto({final List<Child>? children}) : _children = children;

  factory _$_ChildrensDto.fromJson(Map<String, dynamic> json) =>
      _$$_ChildrensDtoFromJson(json);

  final List<Child>? _children;
  @override
  List<Child>? get children {
    final value = _children;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChildrensDto(children: $children)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChildrensDto &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChildrensDtoCopyWith<_$_ChildrensDto> get copyWith =>
      __$$_ChildrensDtoCopyWithImpl<_$_ChildrensDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChildrensDtoToJson(
      this,
    );
  }
}

abstract class _ChildrensDto implements ChildrensDto {
  const factory _ChildrensDto({final List<Child>? children}) = _$_ChildrensDto;

  factory _ChildrensDto.fromJson(Map<String, dynamic> json) =
      _$_ChildrensDto.fromJson;

  @override
  List<Child>? get children;
  @override
  @JsonKey(ignore: true)
  _$$_ChildrensDtoCopyWith<_$_ChildrensDto> get copyWith =>
      throw _privateConstructorUsedError;
}

Child _$ChildFromJson(Map<String, dynamic> json) {
  return _Child.fromJson(json);
}

/// @nodoc
mixin _$Child {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get key => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get userType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChildCopyWith<Child> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChildCopyWith<$Res> {
  factory $ChildCopyWith(Child value, $Res Function(Child) then) =
      _$ChildCopyWithImpl<$Res, Child>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? key,
      String? status,
      String? userType});
}

/// @nodoc
class _$ChildCopyWithImpl<$Res, $Val extends Child>
    implements $ChildCopyWith<$Res> {
  _$ChildCopyWithImpl(this._value, this._then);

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
abstract class _$$_ChildCopyWith<$Res> implements $ChildCopyWith<$Res> {
  factory _$$_ChildCopyWith(_$_Child value, $Res Function(_$_Child) then) =
      __$$_ChildCopyWithImpl<$Res>;
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
class __$$_ChildCopyWithImpl<$Res> extends _$ChildCopyWithImpl<$Res, _$_Child>
    implements _$$_ChildCopyWith<$Res> {
  __$$_ChildCopyWithImpl(_$_Child _value, $Res Function(_$_Child) _then)
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
    return _then(_$_Child(
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
class _$_Child implements _Child {
  const _$_Child({this.id, this.name, this.key, this.status, this.userType});

  factory _$_Child.fromJson(Map<String, dynamic> json) =>
      _$$_ChildFromJson(json);

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
    return 'Child(id: $id, name: $name, key: $key, status: $status, userType: $userType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Child &&
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
  _$$_ChildCopyWith<_$_Child> get copyWith =>
      __$$_ChildCopyWithImpl<_$_Child>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChildToJson(
      this,
    );
  }
}

abstract class _Child implements Child {
  const factory _Child(
      {final String? id,
      final String? name,
      final String? key,
      final String? status,
      final String? userType}) = _$_Child;

  factory _Child.fromJson(Map<String, dynamic> json) = _$_Child.fromJson;

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
  _$$_ChildCopyWith<_$_Child> get copyWith =>
      throw _privateConstructorUsedError;
}
