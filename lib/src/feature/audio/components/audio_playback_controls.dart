import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/base_component.dart';
import 'package:flutter_skeleton/src/feature/audio/components/buttons/play_button.dart';
import 'package:flutter_skeleton/src/feature/audio/components/buttons/play_next_button.dart';
import 'package:flutter_skeleton/src/feature/audio/components/buttons/play_previous_button.dart';
import 'package:flutter_skeleton/src/feature/audio/components/buttons/repeat_button.dart';
import 'package:flutter_skeleton/src/feature/audio/components/buttons/shuffle_button.dart';

class AudioPlaybackControls extends BaseComponent {
  const AudioPlaybackControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        ShuffleButton(),
        PlayPreviousButton(),
        PlayButton(),
        PlayNextButton(),
        RepeatButton(),
      ],
    );
  }
}
