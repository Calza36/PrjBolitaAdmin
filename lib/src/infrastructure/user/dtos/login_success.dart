// To parse this JSON data, do
//
//     final loginSuccess = loginSuccessFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_success.freezed.dart';
part 'login_success.g.dart';

@freezed
class LoginSuccess with _$LoginSuccess {
  const factory LoginSuccess({
    ServerTime? serverTime,
    String? accessToken,
    String? refreshToken,
    User? user,
  }) = _LoginSuccess;

  factory LoginSuccess.fromJson(Map<String, dynamic> json) =>
      _$LoginSuccessFromJson(json);
}

@freezed
class ServerTime with _$ServerTime {
  const factory ServerTime({
    int? hour,
    int? minute,
  }) = _ServerTime;

  factory ServerTime.fromJson(Map<String, dynamic> json) =>
      _$ServerTimeFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    String? id,
    String? name,
    List<String>? children,
    String? userType,
    bool? manageRulesPermit,
    bool? assingRulePermit,
    bool? manageGeneralCollectorsPermit,
    bool? manageCollectorsPermit,
    bool? manageFootCollectorsPermit,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
