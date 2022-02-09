import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/feature/audio/playback_manager.dart';
import 'package:flutter_skeleton/src/feature/audio/notifiers/play_button_notifier.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _playbackManager = singleton<PlaybackManager>();

    return ValueListenableBuilder<PlayButtonState>(
      valueListenable: _playbackManager.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case PlayButtonState.loading:
            return IconButton(
                icon: const Icon(Icons.play_arrow_rounded),
                iconSize: 32.0,
                onPressed: () {});
          case PlayButtonState.paused:
            return IconButton(
              icon: const Icon(Icons.play_arrow_rounded),
              iconSize: 32.0,
              onPressed: _playbackManager.play,
            );
          case PlayButtonState.playing:
            return IconButton(
              icon: const Icon(Icons.pause_rounded),
              iconSize: 32.0,
              onPressed: _playbackManager.pause,
            );
        }
      },
    );
  }
}
