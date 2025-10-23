// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_i.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerationIImpl _$$GenerationIImplFromJson(Map<String, dynamic> json) =>
    _$GenerationIImpl(
      redBlue: RedBlue.fromJson(json['redBlue'] as Map<String, dynamic>),
      yellow: Yellow.fromJson(json['yellow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GenerationIImplToJson(_$GenerationIImpl instance) =>
    <String, dynamic>{
      'redBlue': instance.redBlue,
      'yellow': instance.yellow,
    };

_$RedBlueImpl _$$RedBlueImplFromJson(Map<String, dynamic> json) =>
    _$RedBlueImpl(
      backDefault: json['backDefault'] as String?,
      backGray: json['backGray'] as String?,
      backTransparent: json['backTransparent'] as String?,
      frontDefault: json['frontDefault'] as String?,
      frontGray: json['frontGray'] as String?,
      frontTransparent: json['frontTransparent'] as String?,
    );

Map<String, dynamic> _$$RedBlueImplToJson(_$RedBlueImpl instance) =>
    <String, dynamic>{
      'backDefault': instance.backDefault,
      'backGray': instance.backGray,
      'backTransparent': instance.backTransparent,
      'frontDefault': instance.frontDefault,
      'frontGray': instance.frontGray,
      'frontTransparent': instance.frontTransparent,
    };

_$YellowImpl _$$YellowImplFromJson(Map<String, dynamic> json) => _$YellowImpl(
      backDefault: json['backDefault'] as String?,
      backGray: json['backGray'] as String?,
      backTransparent: json['backTransparent'] as String?,
      frontDefault: json['frontDefault'] as String?,
      frontGray: json['frontGray'] as String?,
      frontTransparent: json['frontTransparent'] as String?,
    );

Map<String, dynamic> _$$YellowImplToJson(_$YellowImpl instance) =>
    <String, dynamic>{
      'backDefault': instance.backDefault,
      'backGray': instance.backGray,
      'backTransparent': instance.backTransparent,
      'frontDefault': instance.frontDefault,
      'frontGray': instance.frontGray,
      'frontTransparent': instance.frontTransparent,
    };
