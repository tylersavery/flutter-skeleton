import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/feature/audio/components/queue_modal.dart';

class ShowPlaylistButton extends StatelessWidget {
  const ShowPlaylistButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.playlist_play_rounded),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          isDismissible: true,
          builder: (context) => const QueueModal(),
        );
      },
    );
  }
}
