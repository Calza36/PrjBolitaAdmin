// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_success.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginSuccess _$$_LoginSuccessFromJson(Map<String, dynamic> json) =>
    _$_LoginSuccess(
      serverTime: json['serverTime'] == null
          ? null
          : ServerTime.fromJson(json['serverTime'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LoginSuccessToJson(_$_LoginSuccess instance) =>
    <String, dynamic>{
      'serverTime': instance.serverTime,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
    };

_$_ServerTime _$$_ServerTimeFromJson(Map<String, dynamic> json) =>
    _$_ServerTime(
      hour: json['hour'] as int?,
      minute: json['minute'] as int?,
    );

Map<String, dynamic> _$$_ServerTimeToJson(_$_ServerTime instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      userType: json['userType'] as String?,
      manageRulesPermit: json['manageRulesPermit'] as bool?,
      assingRulePermit: json['assingRulePermit'] as bool?,
      manageGeneralCollectorsPermit:
          json['manageGeneralCollectorsPermit'] as bool?,
      manageCollectorsPermit: json['manageCollectorsPermit'] as bool?,
      manageFootCollectorsPermit: json['manageFootCollectorsPermit'] as bool?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'children': instance.children,
      'userType': instance.userType,
      'manageRulesPermit': instance.manageRulesPermit,
      'assingRulePermit': instance.assingRulePermit,
      'manageGeneralCollectorsPermit': instance.manageGeneralCollectorsPermit,
      'manageCollectorsPermit': instance.manageCollectorsPermit,
      'manageFootCollectorsPermit': instance.manageFootCollectorsPermit,
    };
