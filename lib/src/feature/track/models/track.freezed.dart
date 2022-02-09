// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Track _$TrackFromJson(Map<String, dynamic> json) {
  return _Track.fromJson(json);
}

/// @nodoc
class _$TrackTearOff {
  const _$TrackTearOff();

  _Track call(
      {required int id,
      required String audio,
      required String name,
      @JsonKey(name: 'artist_name') required String artistName}) {
    return _Track(
      id: id,
      audio: audio,
      name: name,
      artistName: artistName,
    );
  }

  Track fromJson(Map<String, Object?> json) {
    return Track.fromJson(json);
  }
}

/// @nodoc
const $Track = _$TrackTearOff();

/// @nodoc
mixin _$Track {
  int get id => throw _privateConstructorUsedError;
  String get audio => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'artist_name')
  String get artistName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackCopyWith<Track> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackCopyWith<$Res> {
  factory $TrackCopyWith(Track value, $Res Function(Track) then) =
      _$TrackCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String audio,
      String name,
      @JsonKey(name: 'artist_name') String artistName});
}

/// @nodoc
class _$TrackCopyWithImpl<$Res> implements $TrackCopyWith<$Res> {
  _$TrackCopyWithImpl(this._value, this._then);

  final Track _value;
  // ignore: unused_field
  final $Res Function(Track) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? audio = freezed,
    Object? name = freezed,
    Object? artistName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      audio: audio == freezed
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      artistName: artistName == freezed
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TrackCopyWith<$Res> implements $TrackCopyWith<$Res> {
  factory _$TrackCopyWith(_Track value, $Res Function(_Track) then) =
      __$TrackCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String audio,
      String name,
      @JsonKey(name: 'artist_name') String artistName});
}

/// @nodoc
class __$TrackCopyWithImpl<$Res> extends _$TrackCopyWithImpl<$Res>
    implements _$TrackCopyWith<$Res> {
  __$TrackCopyWithImpl(_Track _value, $Res Function(_Track) _then)
      : super(_value, (v) => _then(v as _Track));

  @override
  _Track get _value => super._value as _Track;

  @override
  $Res call({
    Object? id = freezed,
    Object? audio = freezed,
    Object? name = freezed,
    Object? artistName = freezed,
  }) {
    return _then(_Track(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      audio: audio == freezed
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      artistName: artistName == freezed
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Track extends _Track {
  _$_Track(
      {required this.id,
      required this.audio,
      required this.name,
      @JsonKey(name: 'artist_name') required this.artistName})
      : super._();

  factory _$_Track.fromJson(Map<String, dynamic> json) =>
      _$$_TrackFromJson(json);

  @override
  final int id;
  @override
  final String audio;
  @override
  final String name;
  @override
  @JsonKey(name: 'artist_name')
  final String artistName;

  @override
  String toString() {
    return 'Track(id: $id, audio: $audio, name: $name, artistName: $artistName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Track &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.audio, audio) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.artistName, artistName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(audio),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(artistName));

  @JsonKey(ignore: true)
  @override
  _$TrackCopyWith<_Track> get copyWith =>
      __$TrackCopyWithImpl<_Track>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrackToJson(this);
  }
}

abstract class _Track extends Track {
  factory _Track(
      {required int id,
      required String audio,
      required String name,
      @JsonKey(name: 'artist_name') required String artistName}) = _$_Track;
  _Track._() : super._();

  factory _Track.fromJson(Map<String, dynamic> json) = _$_Track.fromJson;

  @override
  int get id;
  @override
  String get audio;
  @override
  String get name;
  @override
  @JsonKey(name: 'artist_name')
  String get artistName;
  @override
  @JsonKey(ignore: true)
  _$TrackCopyWith<_Track> get copyWith => throw _privateConstructorUsedError;
}
