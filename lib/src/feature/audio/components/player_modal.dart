import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/core/base_component.dart';
import 'package:flutter_skeleton/src/feature/audio/components/audio_player.dart';
import 'package:flutter_skeleton/src/feature/audio/playback_manager.dart';
import 'package:flutter_skeleton/src/feature/track/components/bookmark_button.dart';
import 'package:flutter_skeleton/src/feature/track/components/like_button.dart';
import 'package:flutter_skeleton/src/feature/track/models/track.dart';
import 'package:flutter_skeleton/src/feature/theme/app_theme.dart';

class PlayerModal extends BaseComponent {
  const PlayerModal({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _playbackMananger = singleton<PlaybackManager>();

    const padding = 32.0;

    final imageSize = MediaQuery.of(context).size.width - (padding * 2);

    return ValueListenableBuilder<Track?>(
        valueListenable: _playbackMananger.currentTrackNotifier,
        builder: (_, track, __) {
          if (track == null) {
            return const SizedBox();
          }

          return Container(
            width: double.infinity,
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
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.keyboard_arrow_down),
                      ),
                      const Expanded(
                        child: Text(
                          "Now Playing",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(padding).copyWith(top: 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: imageSize,
                          height: imageSize,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(
                              "https://placekitten.com/512/512",
                              width: imageSize,
                              height: imageSize,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    track.name,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  Text(
                                    track.artistName,
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                BookmarkButton(track: track),
                                LikeButton(track: track),
                              ],
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: AudioPlayer(withTrackInfo: false),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
