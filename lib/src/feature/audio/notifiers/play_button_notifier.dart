import 'package:flutter/foundation.dart';

enum PlayButtonState {
  paused,
  playing,
  loading,
}

class PlayButtonNotifier extends ValueNotifier<PlayButtonState> {
  PlayButtonNotifier() : super(_initialValue);
  static const _initialValue = PlayButtonState.paused;
}
