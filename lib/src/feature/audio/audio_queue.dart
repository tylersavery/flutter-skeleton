import 'package:flutter_skeleton/src/feature/track/models/track.dart';

abstract class AudioQueue {
  Future<List<Track>> fetchInitialPlaylist();
  Future<Track> fetchAnotherSong();
}

class PlaylistSingletonImplementation extends AudioQueue {
  @override
  Future<List<Track>> fetchInitialPlaylist({int length = 3}) async {
    return List.generate(length, (index) => _nextSong());
  }

  @override
  Future<Track> fetchAnotherSong() async {
    return _nextSong();
  }

  var _songIndex = 0;

  Track _nextSong() {
    _songIndex = _songIndex + 1;

    final json = {
      'id': _songIndex,
      'name': 'This song is called $_songIndex',
      'artist_name': 'Cool artist $_songIndex',
      'audio':
          'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-$_songIndex.mp3',
    };

    return Track.fromJson(json);
  }
}
