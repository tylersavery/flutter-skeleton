import 'package:freezed_annotation/freezed_annotation.dart';

part 'track.freezed.dart';
part 'track.g.dart';

@freezed
class Track with _$Track {
  const Track._();

  factory Track({
    required int id,
    required String audio,
    required String name,
    @JsonKey(name: 'artist_name') required String artistName,
  }) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}
