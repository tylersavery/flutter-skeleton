import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingProvider extends StateNotifier<bool> {
  LoadingProvider([loading = false]) : super(loading);

  _setLoading([bool value = true]) {
    state = value;
  }

  start() {
    _setLoading(true);
  }

  complete() {
    _setLoading(false);
  }
}

final loadingProvider =
    StateNotifierProvider<LoadingProvider, bool>((ref) => LoadingProvider());
