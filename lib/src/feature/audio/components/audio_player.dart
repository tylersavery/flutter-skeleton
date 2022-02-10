import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/feature/audio/components/audio_playback_controls.dart';
import 'package:flutter_skeleton/src/feature/audio/components/audio_progress_bar.dart';
import 'package:flutter_skeleton/src/feature/audio/components/buttons/show_playlist_button.dart';
import 'package:flutter_skeleton/src/feature/audio/components/current_track_preview.dart';
import 'package:flutter_skeleton/src/feature/theme/app_theme.dart';

class AudioPlayer extends StatelessWidget {
  final bool withTrackInfo;
  const AudioPlayer({
    Key? key,
    this.withTrackInfo = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.playerBackground,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: withTrackInfo
                      ? const CurrentTrackPreview()
                      : const SizedBox(),
                ),
                const AudioPlaybackControls(),
                const Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ShowPlaylistButton(),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              child: AudioProgressBar(),
            ),
          ],
        ),
      ),
    );
  }
}
