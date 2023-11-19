// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Player _$$_PlayerFromJson(Map<String, dynamic> json) => _$_Player(
      id: json['id'] as String?,
      name: json['name'] as String?,
      userType: json['userType'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => Child.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      createUserPermit: json['createUserPermit'] as bool?,
      editUserPermit: json['editUserPermit'] as bool?,
      deleteUserPermit: json['deleteUserPermit'] as bool?,
      manageRulesPermit: json['manageRulesPermit'] as bool?,
      assingRulePermit: json['assingRulePermit'] as bool?,
      manageGeneralCollectorsPermit:
          json['manageGeneralCollectorsPermit'] as bool?,
      manageCollectorsPermit: json['manageCollectorsPermit'] as bool?,
      manageFootCollectorsPermit: json['manageFootCollectorsPermit'] as bool?,
      personalRule: json['personalRule'] as String?,
    );

Map<String, dynamic> _$$_PlayerToJson(_$_Player instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userType': instance.userType,
      'children': instance.children,
      'status': instance.status,
      'createUserPermit': instance.createUserPermit,
      'editUserPermit': instance.editUserPermit,
      'deleteUserPermit': instance.deleteUserPermit,
      'manageRulesPermit': instance.manageRulesPermit,
      'assingRulePermit': instance.assingRulePermit,
      'manageGeneralCollectorsPermit': instance.manageGeneralCollectorsPermit,
      'manageCollectorsPermit': instance.manageCollectorsPermit,
      'manageFootCollectorsPermit': instance.manageFootCollectorsPermit,
      'personalRule': instance.personalRule,
    };

_$_Child _$$_ChildFromJson(Map<String, dynamic> json) => _$_Child(
      id: json['id'] as String?,
      name: json['name'] as String?,
      userType: json['userType'] as String?,
    );

Map<String, dynamic> _$$_ChildToJson(_$_Child instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userType': instance.userType,
    };
