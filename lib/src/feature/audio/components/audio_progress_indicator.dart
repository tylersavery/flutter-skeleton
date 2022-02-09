import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/feature/audio/notifiers/progress_notifier.dart';
import 'package:flutter_skeleton/src/feature/audio/playback_manager.dart';

class AudioProgressIndicator extends StatelessWidget {
  final bool subtle;
  const AudioProgressIndicator({Key? key, this.subtle = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _playbackManager = singleton<PlaybackManager>();

    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: _playbackManager.progressNotifier,
      builder: (_, value, __) {
        final fraction = value.total.inMilliseconds > 0
            ? value.current.inMilliseconds / value.total.inMilliseconds
            : 0.0;

        return Container(
          width: double.infinity,
          height: 3,
          color: Colors.white12,
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: fraction,
            child: Container(
              color: Colors.white60,
            ),
          ),
        );
      },
    );
  }
}
