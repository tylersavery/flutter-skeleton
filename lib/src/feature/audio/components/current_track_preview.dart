import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/feature/audio/playback_manager.dart';
import 'package:flutter_skeleton/src/feature/track/models/track.dart';

class CurrentTrackPreview extends StatelessWidget {
  const CurrentTrackPreview({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _playbackMananger = singleton<PlaybackManager>();
    return ValueListenableBuilder<Track?>(
      valueListenable: _playbackMananger.currentTrackNotifier,
      builder: (_, track, __) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: track != null
              ? Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: Image.network(
                          "https://placekitten.com/64/64",
                          width: 32,
                          height: 32,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          track.name,
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          track.artistName,
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                  ],
                )
              : const SizedBox(),
        );
      },
    );
  }
}
