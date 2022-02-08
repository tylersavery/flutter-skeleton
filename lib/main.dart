import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/app/env.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/feature/audio/audio_queue.dart';
import 'package:flutter_skeleton/src/feature/audio/playback_manager.dart';
import 'package:url_strategy/url_strategy.dart';

import 'src/app.dart';

Future<void> _loadDebugAudio() async {
  final _audioQueue = singleton<AudioQueue>();
  final _audioHandler = singleton<AudioHandler>();

  singleton<PlaybackManager>().init();

  final playlist = await _audioQueue.fetchInitialPlaylist();
  final mediaItems = playlist
      .map((track) => MediaItem(
            id: track.id.toString(),
            title: track.name,
            extras: {
              'url': track.audio,
            },
          ))
      .toList();
  _audioHandler.addQueueItems(mediaItems);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.init();
  setPathUrlStrategy();
  await initSingletons();

  await _loadDebugAudio();

  runApp(const RootRestorationScope(
    restorationId: "root",
    child: ProviderScope(
      child: App(),
    ),
  ));
}
