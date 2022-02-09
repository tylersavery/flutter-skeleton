// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Track _$$_TrackFromJson(Map<String, dynamic> json) => _$_Track(
      id: json['id'] as int,
      audio: json['audio'] as String,
      name: json['name'] as String,
      artistName: json['artist_name'] as String,
    );

Map<String, dynamic> _$$_TrackToJson(_$_Track instance) => <String, dynamic>{
      'id': instance.id,
      'audio': instance.audio,
      'name': instance.name,
      'artist_name': instance.artistName,
    };
