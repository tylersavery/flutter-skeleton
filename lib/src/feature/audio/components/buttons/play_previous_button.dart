import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/feature/audio/playback_manager.dart';

class PlayPreviousButton extends StatelessWidget {
  const PlayPreviousButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _playbackManager = singleton<PlaybackManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: _playbackManager.isLastSongNotifier,
      builder: (_, isFirst, __) {
        return IconButton(
          icon: const Icon(Icons.skip_previous_rounded),
          onPressed: (isFirst) ? null : _playbackManager.previous,
        );
      },
    );
  }
}
