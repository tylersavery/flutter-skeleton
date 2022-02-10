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
                      padding: const EdgeInsets.only(right: 12.0),
                      child: SizedBox(
                        width: 64,
                        height: 64,
                        child: Image.network(
                          "https://placekitten.com/64/64",
                          width: 64,
                          height: 64,
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
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(height: 2),
                        Text(
                          track.artistName,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 14),
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
