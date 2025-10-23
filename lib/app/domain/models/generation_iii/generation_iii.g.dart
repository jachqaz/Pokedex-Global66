// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_iii.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerationIIIImpl _$$GenerationIIIImplFromJson(Map<String, dynamic> json) =>
    _$GenerationIIIImpl(
      emerald: Emerald.fromJson(json['emerald'] as Map<String, dynamic>),
      fireredLeafgreen: FireredLeafgreen.fromJson(
          json['fireredLeafgreen'] as Map<String, dynamic>),
      rubySapphire:
          RubySapphire.fromJson(json['rubySapphire'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GenerationIIIImplToJson(_$GenerationIIIImpl instance) =>
    <String, dynamic>{
      'emerald': instance.emerald,
      'fireredLeafgreen': instance.fireredLeafgreen,
      'rubySapphire': instance.rubySapphire,
    };

_$EmeraldImpl _$$EmeraldImplFromJson(Map<String, dynamic> json) =>
    _$EmeraldImpl(
      frontDefault: json['frontDefault'] as String?,
      frontShiny: json['frontShiny'] as String?,
    );

Map<String, dynamic> _$$EmeraldImplToJson(_$EmeraldImpl instance) =>
    <String, dynamic>{
      'frontDefault': instance.frontDefault,
      'frontShiny': instance.frontShiny,
    };

_$FireredLeafgreenImpl _$$FireredLeafgreenImplFromJson(
        Map<String, dynamic> json) =>
    _$FireredLeafgreenImpl(
      backDefault: json['backDefault'] as String?,
      backShiny: json['backShiny'] as String?,
      frontDefault: json['frontDefault'] as String?,
      frontShiny: json['frontShiny'] as String?,
    );

Map<String, dynamic> _$$FireredLeafgreenImplToJson(
        _$FireredLeafgreenImpl instance) =>
    <String, dynamic>{
      'backDefault': instance.backDefault,
      'backShiny': instance.backShiny,
      'frontDefault': instance.frontDefault,
      'frontShiny': instance.frontShiny,
    };

_$RubySapphireImpl _$$RubySapphireImplFromJson(Map<String, dynamic> json) =>
    _$RubySapphireImpl(
      backDefault: json['backDefault'] as String?,
      backShiny: json['backShiny'] as String?,
      frontDefault: json['frontDefault'] as String?,
      frontShiny: json['frontShiny'] as String?,
    );

Map<String, dynamic> _$$RubySapphireImplToJson(_$RubySapphireImpl instance) =>
    <String, dynamic>{
      'backDefault': instance.backDefault,
      'backShiny': instance.backShiny,
      'frontDefault': instance.frontDefault,
      'frontShiny': instance.frontShiny,
    };
