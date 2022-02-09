import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/feature/audio/playback_manager.dart';
import 'package:flutter_skeleton/src/feature/track/models/track.dart';

class QueueList extends StatelessWidget {
  const QueueList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _playbackManager = singleton<PlaybackManager>();
    return ValueListenableBuilder<List<Track>>(
      valueListenable: _playbackManager.playlistNotifier,
      builder: (context, tracks, _) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: tracks.length,
          itemBuilder: (context, index) {
            final track = tracks[index];
            return ListTile(
              title: Text(track.name),
              subtitle: Text(track.artistName),
              trailing: const Icon(Icons.play_arrow),
              onTap: () {
                _playbackManager.skipToQueueIndex(index);
              },
            );
          },
        );
      },
    );
  }
}
