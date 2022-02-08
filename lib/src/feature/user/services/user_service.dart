import 'package:flutter_skeleton/src/core/app/api_service.dart';
import 'package:flutter_skeleton/src/core/models/paginated_response.dart';
import 'package:flutter_skeleton/src/feature/user/models/user.dart';

class UserService extends ApiService {
  Future<User> me() async {
    try {
      final response = await getHttp('/user/current');
      return User.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> retrieve(String uuid) async {
    try {
      final response = await getHttp('/user/$uuid');
      return User.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<PaginatedResponse<User>> list({int page = 1, int limit = 10}) async {
    try {
      final _params = {
        ...buildPage(page),
        ...buildLimit(limit),
      };

      final response = await getHttp('/user', params: _params);

      List<User> results =
          response['results'].map<User>((item) => User.fromJson(item)).toList();

      return PaginatedResponse(
        count: response['count'],
        page: response['page'],
        num_pages: response['num_pages'],
        results: results,
      );
    } catch (e) {
      return PaginatedResponse.empty();
    }
  }
}
