// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_ii.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerationIIImpl _$$GenerationIIImplFromJson(Map<String, dynamic> json) =>
    _$GenerationIIImpl(
      crystal: Crystal.fromJson(json['crystal'] as Map<String, dynamic>),
      gold: Gold.fromJson(json['gold'] as Map<String, dynamic>),
      silver: Silver.fromJson(json['silver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GenerationIIImplToJson(_$GenerationIIImpl instance) =>
    <String, dynamic>{
      'crystal': instance.crystal,
      'gold': instance.gold,
      'silver': instance.silver,
    };

_$CrystalImpl _$$CrystalImplFromJson(Map<String, dynamic> json) =>
    _$CrystalImpl(
      backDefault: json['backDefault'] as String?,
      backShiny: json['backShiny'] as String?,
      backShinyTransparent: json['backShinyTransparent'] as String?,
      backTransparent: json['backTransparent'] as String?,
      frontDefault: json['frontDefault'] as String?,
      frontShiny: json['frontShiny'] as String?,
      frontShinyTransparent: json['frontShinyTransparent'] as String?,
      frontTransparent: json['frontTransparent'] as String?,
    );

Map<String, dynamic> _$$CrystalImplToJson(_$CrystalImpl instance) =>
    <String, dynamic>{
      'backDefault': instance.backDefault,
      'backShiny': instance.backShiny,
      'backShinyTransparent': instance.backShinyTransparent,
      'backTransparent': instance.backTransparent,
      'frontDefault': instance.frontDefault,
      'frontShiny': instance.frontShiny,
      'frontShinyTransparent': instance.frontShinyTransparent,
      'frontTransparent': instance.frontTransparent,
    };

_$GoldImpl _$$GoldImplFromJson(Map<String, dynamic> json) => _$GoldImpl(
      backDefault: json['backDefault'] as String?,
      backShiny: json['backShiny'] as String?,
      frontDefault: json['frontDefault'] as String?,
      frontShiny: json['frontShiny'] as String?,
      frontTransparent: json['frontTransparent'] as String?,
    );

Map<String, dynamic> _$$GoldImplToJson(_$GoldImpl instance) =>
    <String, dynamic>{
      'backDefault': instance.backDefault,
      'backShiny': instance.backShiny,
      'frontDefault': instance.frontDefault,
      'frontShiny': instance.frontShiny,
      'frontTransparent': instance.frontTransparent,
    };

_$SilverImpl _$$SilverImplFromJson(Map<String, dynamic> json) => _$SilverImpl(
      backDefault: json['backDefault'] as String?,
      backShiny: json['backShiny'] as String?,
      frontDefault: json['frontDefault'] as String?,
      frontShiny: json['frontShiny'] as String?,
      frontTransparent: json['frontTransparent'] as String?,
    );

Map<String, dynamic> _$$SilverImplToJson(_$SilverImpl instance) =>
    <String, dynamic>{
      'backDefault': instance.backDefault,
      'backShiny': instance.backShiny,
      'frontDefault': instance.frontDefault,
      'frontShiny': instance.frontShiny,
      'frontTransparent': instance.frontTransparent,
    };
