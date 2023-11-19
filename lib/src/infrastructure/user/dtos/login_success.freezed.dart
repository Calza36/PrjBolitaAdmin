// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_success.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginSuccess _$LoginSuccessFromJson(Map<String, dynamic> json) {
  return _LoginSuccess.fromJson(json);
}

/// @nodoc
mixin _$LoginSuccess {
  ServerTime? get serverTime => throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginSuccessCopyWith<LoginSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginSuccessCopyWith<$Res> {
  factory $LoginSuccessCopyWith(
          LoginSuccess value, $Res Function(LoginSuccess) then) =
      _$LoginSuccessCopyWithImpl<$Res, LoginSuccess>;
  @useResult
  $Res call(
      {ServerTime? serverTime,
      String? accessToken,
      String? refreshToken,
      User? user});

  $ServerTimeCopyWith<$Res>? get serverTime;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$LoginSuccessCopyWithImpl<$Res, $Val extends LoginSuccess>
    implements $LoginSuccessCopyWith<$Res> {
  _$LoginSuccessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverTime = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      serverTime: freezed == serverTime
          ? _value.serverTime
          : serverTime // ignore: cast_nullable_to_non_nullable
              as ServerTime?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServerTimeCopyWith<$Res>? get serverTime {
    if (_value.serverTime == null) {
      return null;
    }

    return $ServerTimeCopyWith<$Res>(_value.serverTime!, (value) {
      return _then(_value.copyWith(serverTime: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoginSuccessCopyWith<$Res>
    implements $LoginSuccessCopyWith<$Res> {
  factory _$$_LoginSuccessCopyWith(
          _$_LoginSuccess value, $Res Function(_$_LoginSuccess) then) =
      __$$_LoginSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ServerTime? serverTime,
      String? accessToken,
      String? refreshToken,
      User? user});

  @override
  $ServerTimeCopyWith<$Res>? get serverTime;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_LoginSuccessCopyWithImpl<$Res>
    extends _$LoginSuccessCopyWithImpl<$Res, _$_LoginSuccess>
    implements _$$_LoginSuccessCopyWith<$Res> {
  __$$_LoginSuccessCopyWithImpl(
      _$_LoginSuccess _value, $Res Function(_$_LoginSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverTime = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_LoginSuccess(
      serverTime: freezed == serverTime
          ? _value.serverTime
          : serverTime // ignore: cast_nullable_to_non_nullable
              as ServerTime?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginSuccess implements _LoginSuccess {
  const _$_LoginSuccess(
      {this.serverTime, this.accessToken, this.refreshToken, this.user});

  factory _$_LoginSuccess.fromJson(Map<String, dynamic> json) =>
      _$$_LoginSuccessFromJson(json);

  @override
  final ServerTime? serverTime;
  @override
  final String? accessToken;
  @override
  final String? refreshToken;
  @override
  final User? user;

  @override
  String toString() {
    return 'LoginSuccess(serverTime: $serverTime, accessToken: $accessToken, refreshToken: $refreshToken, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginSuccess &&
            (identical(other.serverTime, serverTime) ||
                other.serverTime == serverTime) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, serverTime, accessToken, refreshToken, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginSuccessCopyWith<_$_LoginSuccess> get copyWith =>
      __$$_LoginSuccessCopyWithImpl<_$_LoginSuccess>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginSuccessToJson(
      this,
    );
  }
}

abstract class _LoginSuccess implements LoginSuccess {
  const factory _LoginSuccess(
      {final ServerTime? serverTime,
      final String? accessToken,
      final String? refreshToken,
      final User? user}) = _$_LoginSuccess;

  factory _LoginSuccess.fromJson(Map<String, dynamic> json) =
      _$_LoginSuccess.fromJson;

  @override
  ServerTime? get serverTime;
  @override
  String? get accessToken;
  @override
  String? get refreshToken;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$_LoginSuccessCopyWith<_$_LoginSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

ServerTime _$ServerTimeFromJson(Map<String, dynamic> json) {
  return _ServerTime.fromJson(json);
}

/// @nodoc
mixin _$ServerTime {
  int? get hour => throw _privateConstructorUsedError;
  int? get minute => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerTimeCopyWith<ServerTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerTimeCopyWith<$Res> {
  factory $ServerTimeCopyWith(
          ServerTime value, $Res Function(ServerTime) then) =
      _$ServerTimeCopyWithImpl<$Res, ServerTime>;
  @useResult
  $Res call({int? hour, int? minute});
}

/// @nodoc
class _$ServerTimeCopyWithImpl<$Res, $Val extends ServerTime>
    implements $ServerTimeCopyWith<$Res> {
  _$ServerTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = freezed,
    Object? minute = freezed,
  }) {
    return _then(_value.copyWith(
      hour: freezed == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int?,
      minute: freezed == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServerTimeCopyWith<$Res>
    implements $ServerTimeCopyWith<$Res> {
  factory _$$_ServerTimeCopyWith(
          _$_ServerTime value, $Res Function(_$_ServerTime) then) =
      __$$_ServerTimeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? hour, int? minute});
}

/// @nodoc
class __$$_ServerTimeCopyWithImpl<$Res>
    extends _$ServerTimeCopyWithImpl<$Res, _$_ServerTime>
    implements _$$_ServerTimeCopyWith<$Res> {
  __$$_ServerTimeCopyWithImpl(
      _$_ServerTime _value, $Res Function(_$_ServerTime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = freezed,
    Object? minute = freezed,
  }) {
    return _then(_$_ServerTime(
      hour: freezed == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int?,
      minute: freezed == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServerTime implements _ServerTime {
  const _$_ServerTime({this.hour, this.minute});

  factory _$_ServerTime.fromJson(Map<String, dynamic> json) =>
      _$$_ServerTimeFromJson(json);

  @override
  final int? hour;
  @override
  final int? minute;

  @override
  String toString() {
    return 'ServerTime(hour: $hour, minute: $minute)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServerTime &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hour, minute);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServerTimeCopyWith<_$_ServerTime> get copyWith =>
      __$$_ServerTimeCopyWithImpl<_$_ServerTime>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServerTimeToJson(
      this,
    );
  }
}

abstract class _ServerTime implements ServerTime {
  const factory _ServerTime({final int? hour, final int? minute}) =
      _$_ServerTime;

  factory _ServerTime.fromJson(Map<String, dynamic> json) =
      _$_ServerTime.fromJson;

  @override
  int? get hour;
  @override
  int? get minute;
  @override
  @JsonKey(ignore: true)
  _$$_ServerTimeCopyWith<_$_ServerTime> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<String>? get children => throw _privateConstructorUsedError;
  String? get userType => throw _privateConstructorUsedError;
  bool? get manageRulesPermit => throw _privateConstructorUsedError;
  bool? get assingRulePermit => throw _privateConstructorUsedError;
  bool? get manageGeneralCollectorsPermit => throw _privateConstructorUsedError;
  bool? get manageCollectorsPermit => throw _privateConstructorUsedError;
  bool? get manageFootCollectorsPermit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      List<String>? children,
      String? userType,
      bool? manageRulesPermit,
      bool? assingRulePermit,
      bool? manageGeneralCollectorsPermit,
      bool? manageCollectorsPermit,
      bool? manageFootCollectorsPermit});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? children = freezed,
    Object? userType = freezed,
    Object? manageRulesPermit = freezed,
    Object? assingRulePermit = freezed,
    Object? manageGeneralCollectorsPermit = freezed,
    Object? manageCollectorsPermit = freezed,
    Object? manageFootCollectorsPermit = freezed,
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
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      manageRulesPermit: freezed == manageRulesPermit
          ? _value.manageRulesPermit
          : manageRulesPermit // ignore: cast_nullable_to_non_nullable
              as bool?,
      assingRulePermit: freezed == assingRulePermit
          ? _value.assingRulePermit
          : assingRulePermit // ignore: cast_nullable_to_non_nullable
              as bool?,
      manageGeneralCollectorsPermit: freezed == manageGeneralCollectorsPermit
          ? _value.manageGeneralCollectorsPermit
          : manageGeneralCollectorsPermit // ignore: cast_nullable_to_non_nullable
              as bool?,
      manageCollectorsPermit: freezed == manageCollectorsPermit
          ? _value.manageCollectorsPermit
          : manageCollectorsPermit // ignore: cast_nullable_to_non_nullable
              as bool?,
      manageFootCollectorsPermit: freezed == manageFootCollectorsPermit
          ? _value.manageFootCollectorsPermit
          : manageFootCollectorsPermit // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      List<String>? children,
      String? userType,
      bool? manageRulesPermit,
      bool? assingRulePermit,
      bool? manageGeneralCollectorsPermit,
      bool? manageCollectorsPermit,
      bool? manageFootCollectorsPermit});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? children = freezed,
    Object? userType = freezed,
    Object? manageRulesPermit = freezed,
    Object? assingRulePermit = freezed,
    Object? manageGeneralCollectorsPermit = freezed,
    Object? manageCollectorsPermit = freezed,
    Object? manageFootCollectorsPermit = freezed,
  }) {
    return _then(_$_User(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      manageRulesPermit: freezed == manageRulesPermit
          ? _value.manageRulesPermit
          : manageRulesPermit // ignore: cast_nullable_to_non_nullable
              as bool?,
      assingRulePermit: freezed == assingRulePermit
          ? _value.assingRulePermit
          : assingRulePermit // ignore: cast_nullable_to_non_nullable
              as bool?,
      manageGeneralCollectorsPermit: freezed == manageGeneralCollectorsPermit
          ? _value.manageGeneralCollectorsPermit
          : manageGeneralCollectorsPermit // ignore: cast_nullable_to_non_nullable
              as bool?,
      manageCollectorsPermit: freezed == manageCollectorsPermit
          ? _value.manageCollectorsPermit
          : manageCollectorsPermit // ignore: cast_nullable_to_non_nullable
              as bool?,
      manageFootCollectorsPermit: freezed == manageFootCollectorsPermit
          ? _value.manageFootCollectorsPermit
          : manageFootCollectorsPermit // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {this.id,
      this.name,
      final List<String>? children,
      this.userType,
      this.manageRulesPermit,
      this.assingRulePermit,
      this.manageGeneralCollectorsPermit,
      this.manageCollectorsPermit,
      this.manageFootCollectorsPermit})
      : _children = children;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  final List<String>? _children;
  @override
  List<String>? get children {
    final value = _children;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? userType;
  @override
  final bool? manageRulesPermit;
  @override
  final bool? assingRulePermit;
  @override
  final bool? manageGeneralCollectorsPermit;
  @override
  final bool? manageCollectorsPermit;
  @override
  final bool? manageFootCollectorsPermit;

  @override
  String toString() {
    return 'User(id: $id, name: $name, children: $children, userType: $userType, manageRulesPermit: $manageRulesPermit, assingRulePermit: $assingRulePermit, manageGeneralCollectorsPermit: $manageGeneralCollectorsPermit, manageCollectorsPermit: $manageCollectorsPermit, manageFootCollectorsPermit: $manageFootCollectorsPermit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.manageRulesPermit, manageRulesPermit) ||
                other.manageRulesPermit == manageRulesPermit) &&
            (identical(other.assingRulePermit, assingRulePermit) ||
                other.assingRulePermit == assingRulePermit) &&
            (identical(other.manageGeneralCollectorsPermit,
                    manageGeneralCollectorsPermit) ||
                other.manageGeneralCollectorsPermit ==
                    manageGeneralCollectorsPermit) &&
            (identical(other.manageCollectorsPermit, manageCollectorsPermit) ||
                other.manageCollectorsPermit == manageCollectorsPermit) &&
            (identical(other.manageFootCollectorsPermit,
                    manageFootCollectorsPermit) ||
                other.manageFootCollectorsPermit ==
                    manageFootCollectorsPermit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_children),
      userType,
      manageRulesPermit,
      assingRulePermit,
      manageGeneralCollectorsPermit,
      manageCollectorsPermit,
      manageFootCollectorsPermit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {final String? id,
      final String? name,
      final List<String>? children,
      final String? userType,
      final bool? manageRulesPermit,
      final bool? assingRulePermit,
      final bool? manageGeneralCollectorsPermit,
      final bool? manageCollectorsPermit,
      final bool? manageFootCollectorsPermit}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  List<String>? get children;
  @override
  String? get userType;
  @override
  bool? get manageRulesPermit;
  @override
  bool? get assingRulePermit;
  @override
  bool? get manageGeneralCollectorsPermit;
  @override
  bool? get manageCollectorsPermit;
  @override
  bool? get manageFootCollectorsPermit;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
