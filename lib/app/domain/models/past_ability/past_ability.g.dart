// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'past_ability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PastAbilityImpl _$$PastAbilityImplFromJson(Map<String, dynamic> json) =>
    _$PastAbilityImpl(
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Ability.fromJson(e as Map<String, dynamic>))
          .toList(),
      generation:
          Generation.fromJson(json['generation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PastAbilityImplToJson(_$PastAbilityImpl instance) =>
    <String, dynamic>{
      'abilities': instance.abilities,
      'generation': instance.generation,
    };
