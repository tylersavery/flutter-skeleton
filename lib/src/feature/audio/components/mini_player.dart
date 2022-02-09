import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/feature/audio/components/audio_progress_indicator.dart';
import 'package:flutter_skeleton/src/feature/audio/components/buttons/play_button.dart';
import 'package:flutter_skeleton/src/feature/audio/components/current_track_preview.dart';
import 'package:flutter_skeleton/src/feature/audio/components/player_modal.dart';
import 'package:flutter_skeleton/src/feature/theme/app_theme.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          isDismissible: true,
          builder: (context) => const PlayerModal(),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.playerBackground,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6.0),
            topRight: Radius.circular(6.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: Row(
                children: const [
                  Expanded(child: CurrentTrackPreview()),
                  PlayButton()
                ],
              ),
            ),
            const AudioProgressIndicator()
          ],
        ),
      ),
    );
  }
}
