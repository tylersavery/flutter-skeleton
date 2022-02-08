import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/feature/audio/playback_manager.dart';

class PlayNextButton extends StatelessWidget {
  const PlayNextButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _playbackManager = singleton<PlaybackManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: _playbackManager.isLastSongNotifier,
      builder: (_, isLast, __) {
        return IconButton(
          icon: const Icon(Icons.skip_next_rounded),
          onPressed: (isLast) ? null : _playbackManager.next,
        );
      },
    );
  }
}
