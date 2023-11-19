// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'childrens_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChildrensDto _$$_ChildrensDtoFromJson(Map<String, dynamic> json) =>
    _$_ChildrensDto(
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => Child.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChildrensDtoToJson(_$_ChildrensDto instance) =>
    <String, dynamic>{
      'children': instance.children,
    };

_$_Child _$$_ChildFromJson(Map<String, dynamic> json) => _$_Child(
      id: json['id'] as String?,
      name: json['name'] as String?,
      key: json['key'] as String?,
      status: json['status'] as String?,
      userType: json['userType'] as String?,
    );

Map<String, dynamic> _$$_ChildToJson(_$_Child instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'key': instance.key,
      'status': instance.status,
      'userType': instance.userType,
    };
