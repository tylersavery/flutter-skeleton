import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/base_component.dart';
import 'package:flutter_skeleton/src/feature/track/models/track.dart';

class LikeButton extends BaseComponent {
  final Track track;

  const LikeButton({
    Key? key,
    required this.track,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.favorite_outline),
    );
  }
}
