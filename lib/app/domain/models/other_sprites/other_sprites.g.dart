// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_sprites.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtherSpritesImpl _$$OtherSpritesImplFromJson(Map<String, dynamic> json) =>
    _$OtherSpritesImpl(
      dreamWorld:
          DreamWorld.fromJson(json['dreamWorld'] as Map<String, dynamic>),
      home: Home.fromJson(json['home'] as Map<String, dynamic>),
      officialArtwork: OfficialArtwork.fromJson(
          json['officialArtwork'] as Map<String, dynamic>),
      showdown: Showdown.fromJson(json['showdown'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OtherSpritesImplToJson(_$OtherSpritesImpl instance) =>
    <String, dynamic>{
      'dreamWorld': instance.dreamWorld,
      'home': instance.home,
      'officialArtwork': instance.officialArtwork,
      'showdown': instance.showdown,
    };
