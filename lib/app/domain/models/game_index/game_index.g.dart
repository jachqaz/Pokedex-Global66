// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameIndexImpl _$$GameIndexImplFromJson(Map<String, dynamic> json) =>
    _$GameIndexImpl(
      gameIndex: (json['gameIndex'] as num?)?.toInt(),
      version: json['version'] == null
          ? null
          : Version.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GameIndexImplToJson(_$GameIndexImpl instance) =>
    <String, dynamic>{
      'gameIndex': instance.gameIndex,
      'version': instance.version,
    };
