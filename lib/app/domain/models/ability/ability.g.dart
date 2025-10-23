// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbilityImpl _$$AbilityImplFromJson(Map<String, dynamic> json) =>
    _$AbilityImpl(
      ability: AbilityDetail.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['isHidden'] as bool?,
      slot: (json['slot'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AbilityImplToJson(_$AbilityImpl instance) =>
    <String, dynamic>{
      'ability': instance.ability,
      'isHidden': instance.isHidden,
      'slot': instance.slot,
    };
