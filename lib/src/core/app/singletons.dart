import 'package:audio_service/audio_service.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/feature/audio/audio_handler.dart';
import 'package:flutter_skeleton/src/feature/audio/audio_queue.dart';
import 'package:flutter_skeleton/src/feature/audio/playback_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_skeleton/src/core/app/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final singleton = GetIt.instance;

Future<void> initSingletons() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  singleton.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  singleton.registerSingleton<AppRouter>(AppRouter());

  singleton.registerSingleton<AudioHandler>(await initAudioService());
  singleton.registerSingleton<AudioQueue>(PlaylistSingletonImplementation());
  singleton.registerLazySingleton<PlaybackManager>(() => PlaybackManager());
  singleton.registerLazySingleton<Storage>(
    () => StorageImplementation(),
  );
}
