// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sprites.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpritesImpl _$$SpritesImplFromJson(Map<String, dynamic> json) =>
    _$SpritesImpl(
      backDefault: json['back_default'] as String?,
      backFemale: json['back_female'] as String?,
      backShiny: json['back_shiny'] as String?,
      backShinyFemale: json['back_shiny_female'] as String?,
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
      other: OtherSprites.fromJson(json['other'] as Map<String, dynamic>),
      versions:
          SpritesVersions.fromJson(json['versions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SpritesImplToJson(_$SpritesImpl instance) =>
    <String, dynamic>{
      'back_default': instance.backDefault,
      'back_female': instance.backFemale,
      'back_shiny': instance.backShiny,
      'back_shiny_female': instance.backShinyFemale,
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
      'other': instance.other,
      'versions': instance.versions,
    };
