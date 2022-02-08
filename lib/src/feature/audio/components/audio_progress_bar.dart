import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/feature/audio/notifiers/progress_notifier.dart';
import 'package:flutter_skeleton/src/feature/audio/playback_manager.dart';

class AudioProgressBar extends StatelessWidget {
  final bool subtle;
  const AudioProgressBar({Key? key, this.subtle = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _playbackManager = singleton<PlaybackManager>();

    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: _playbackManager.progressNotifier,
      builder: (_, value, __) {
        return ProgressBar(
          progress: value.current,
          buffered: value.buffered,
          total: value.total,
          onSeek: _playbackManager.seek,
          barHeight: subtle ? 2 : 4,
        );
      },
    );
  }
}
