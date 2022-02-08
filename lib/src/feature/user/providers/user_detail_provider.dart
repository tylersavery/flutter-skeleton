import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/feature/user/models/user.dart';
import 'package:flutter_skeleton/src/feature/user/services/user_service.dart';

final userDetailProvider =
    FutureProvider.family<User, String>((ref, String uuid) async {
  return UserService().retrieve(uuid);
});
