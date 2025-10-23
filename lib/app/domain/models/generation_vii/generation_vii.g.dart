// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_vii.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerationVIIImpl _$$GenerationVIIImplFromJson(Map<String, dynamic> json) =>
    _$GenerationVIIImpl(
      icons: Icons.fromJson(json['icons'] as Map<String, dynamic>),
      ultraSunUltraMoon: UltraSunUltraMoon.fromJson(
          json['ultraSunUltraMoon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GenerationVIIImplToJson(_$GenerationVIIImpl instance) =>
    <String, dynamic>{
      'icons': instance.icons,
      'ultraSunUltraMoon': instance.ultraSunUltraMoon,
    };

_$IconsImpl _$$IconsImplFromJson(Map<String, dynamic> json) => _$IconsImpl(
      frontDefault: json['frontDefault'] as String?,
      frontFemale: json['frontFemale'] as String?,
    );

Map<String, dynamic> _$$IconsImplToJson(_$IconsImpl instance) =>
    <String, dynamic>{
      'frontDefault': instance.frontDefault,
      'frontFemale': instance.frontFemale,
    };

_$UltraSunUltraMoonImpl _$$UltraSunUltraMoonImplFromJson(
        Map<String, dynamic> json) =>
    _$UltraSunUltraMoonImpl(
      frontDefault: json['frontDefault'] as String?,
      frontFemale: json['frontFemale'] as String?,
      frontShiny: json['frontShiny'] as String?,
      frontShinyFemale: json['frontShinyFemale'] as String?,
    );

Map<String, dynamic> _$$UltraSunUltraMoonImplToJson(
        _$UltraSunUltraMoonImpl instance) =>
    <String, dynamic>{
      'frontDefault': instance.frontDefault,
      'frontFemale': instance.frontFemale,
      'frontShiny': instance.frontShiny,
      'frontShinyFemale': instance.frontShinyFemale,
    };
