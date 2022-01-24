import 'package:flutter/material.dart';

class CenteredLoader extends StatelessWidget {
  const CenteredLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
