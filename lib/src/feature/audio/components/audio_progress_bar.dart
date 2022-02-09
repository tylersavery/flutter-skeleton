import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/feature/audio/notifiers/progress_notifier.dart';
import 'package:flutter_skeleton/src/feature/audio/playback_manager.dart';

class AudioProgressBar extends StatelessWidget {
  const AudioProgressBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _playbackManager = singleton<PlaybackManager>();

    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: _playbackManager.progressNotifier,
      builder: (_, value, __) {
        final textColor = Theme.of(context).textTheme.bodyText1!.color!;

        return ProgressBar(
          progress: value.current,
          buffered: value.buffered,
          total: value.total,
          onSeek: _playbackManager.seek,
          barHeight: 2,
          thumbRadius: 4,
          baseBarColor: textColor.withOpacity(0.15),
          progressBarColor: textColor.withOpacity(0.4),
          bufferedBarColor: textColor.withOpacity(0.2),
          thumbColor: Theme.of(context).primaryColor,
        );
      },
    );
  }
}
