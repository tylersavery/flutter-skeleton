import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/feature/audio/audio_queue.dart';
import 'package:flutter_skeleton/src/feature/audio/notifiers/play_button_notifier.dart';
import 'package:flutter_skeleton/src/feature/audio/notifiers/progress_notifier.dart';
import 'package:flutter_skeleton/src/feature/audio/notifiers/repeat_button_notifier.dart';
import 'package:flutter_skeleton/src/feature/track/models/track.dart';

class PlaybackManager {
  final currentTrackNotifier = ValueNotifier<Track?>(null);
  final currentSongTitleNotifier = ValueNotifier<String>('');
  final playlistNotifier = ValueNotifier<List<Track>>([]);
  final progressNotifier = ProgressNotifier();
  final repeatButtonNotifier = RepeatButtonNotifier();
  final isFirstSongNotifier = ValueNotifier<bool>(true);
  final playButtonNotifier = PlayButtonNotifier();
  final isLastSongNotifier = ValueNotifier<bool>(true);
  final isShuffleModeEnabledNotifier = ValueNotifier<bool>(false);

  final _audioHandler = singleton<AudioHandler>();

  void init() async {
    await _loadPlaylist();
    _listenToChangesInPlaylist();
    _listenToPlaybackState();
    _listenToCurrentPosition();
    _listenToBufferedPosition();
    _listenToTotalDuration();
    _listenToChangesInSong();
  }

  Future<void> _loadPlaylist() async {
    final audioQueue = singleton<AudioQueue>();
    final playlist = await audioQueue.fetchInitialPlaylist();
    final mediaItems = playlist
        .map((track) => MediaItem(
              id: track.id.toString(),
              // album: song['album'] ?? '',
              title: track.name,
              extras: {'url': track.audio},
            ))
        .toList();
    _audioHandler.addQueueItems(mediaItems);
    playlistNotifier.value = playlist;
  }

  void _listenToChangesInPlaylist() {
    _audioHandler.queue.listen((playlist) {
      if (playlist.isEmpty) {
        playlistNotifier.value = [];
        currentSongTitleNotifier.value = '';
        currentTrackNotifier.value = null;
      } else {
        final ids = playlist.map((item) => item.id).toList();

        final List<Track> newList = [];
        for (final id in ids) {
          final track = _mediaItemIdToTrack(id);

          if (track != null) {
            newList.add(track);
          }
        }

        playlistNotifier.value = newList;
      }
      _updateSkipButtons();
    });
  }

  void _listenToPlaybackState() {
    _audioHandler.playbackState.listen((playbackState) {
      final isPlaying = playbackState.playing;
      final processingState = playbackState.processingState;
      if (processingState == AudioProcessingState.loading ||
          processingState == AudioProcessingState.buffering) {
        playButtonNotifier.value = PlayButtonState.loading;
      } else if (!isPlaying) {
        playButtonNotifier.value = PlayButtonState.paused;
      } else if (processingState != AudioProcessingState.completed) {
        playButtonNotifier.value = PlayButtonState.playing;
      } else {
        _audioHandler.seek(Duration.zero);
        _audioHandler.pause();
      }
    });
  }

  void _listenToCurrentPosition() {
    AudioService.position.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });
  }

  void _listenToBufferedPosition() {
    _audioHandler.playbackState.listen((playbackState) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: playbackState.bufferedPosition,
        total: oldState.total,
      );
    });
  }

  void _listenToTotalDuration() {
    _audioHandler.mediaItem.listen((mediaItem) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: mediaItem?.duration ?? Duration.zero,
      );
    });
  }

  void _listenToChangesInSong() {
    _audioHandler.mediaItem.listen((mediaItem) {
      currentSongTitleNotifier.value = mediaItem?.title ?? '';
      currentTrackNotifier.value = _mediaItemIdToTrack(mediaItem?.id);
    });
  }

  Track? _mediaItemIdToTrack(String? mediaItemId) {
    if (mediaItemId == null) return null;

    return playlistNotifier.value.firstWhereOrNull(
      (element) => element.id.toString() == mediaItemId,
    );
  }

  void _updateSkipButtons() {
    final mediaItem = _audioHandler.mediaItem.value;
    final playlist = _audioHandler.queue.value;
    if (playlist.length < 2 || mediaItem == null) {
      isFirstSongNotifier.value = true;
      isLastSongNotifier.value = true;
    } else {
      isFirstSongNotifier.value = playlist.first == mediaItem;
      isLastSongNotifier.value = playlist.last == mediaItem;
    }
  }

  void play() => _audioHandler.play();
  void pause() => _audioHandler.pause();

  void seek(Duration position) => _audioHandler.seek(position);

  void previous() => _audioHandler.skipToPrevious();
  void next() => _audioHandler.skipToNext();
  void skipToQueueIndex(int index) => _audioHandler.skipToQueueItem(index);

  void repeat() {
    repeatButtonNotifier.nextState();
    final repeatMode = repeatButtonNotifier.value;
    switch (repeatMode) {
      case RepeatState.off:
        _audioHandler.setRepeatMode(AudioServiceRepeatMode.none);
        break;
      case RepeatState.repeatSong:
        _audioHandler.setRepeatMode(AudioServiceRepeatMode.one);
        break;
      case RepeatState.repeatPlaylist:
        _audioHandler.setRepeatMode(AudioServiceRepeatMode.all);
        break;
    }
  }

  void shuffle() {
    final enable = !isShuffleModeEnabledNotifier.value;
    isShuffleModeEnabledNotifier.value = enable;
    if (enable) {
      _audioHandler.setShuffleMode(AudioServiceShuffleMode.all);
    } else {
      _audioHandler.setShuffleMode(AudioServiceShuffleMode.none);
    }
  }

  Future<void> add() async {
    final audioQueue = singleton<AudioQueue>();
    final track = await audioQueue.fetchAnotherSong();
    final mediaItem = MediaItem(
      id: track.id.toString(),
      // album: song['album'] ?? '',
      title: track.name,
      extras: {'url': track.audio},
    );
    _audioHandler.addQueueItem(mediaItem);
  }

  void remove() {
    final lastIndex = _audioHandler.queue.value.length - 1;
    if (lastIndex < 0) return;
    _audioHandler.removeQueueItemAt(lastIndex);
  }

  void dispose() {
    _audioHandler.customAction('dispose');
  }

  void stop() {
    _audioHandler.stop();
  }
}
