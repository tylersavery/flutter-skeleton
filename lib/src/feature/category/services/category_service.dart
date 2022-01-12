import 'package:flutter_skeleton/src/core/app/api_service.dart';
import 'package:flutter_skeleton/src/core/models/paginated_response.dart';
import 'package:flutter_skeleton/src/feature/category/models/category.dart';

class CategoryService extends ApiService {
  Future<PaginatedResponse<Category>> list(
      {int page = 1, int limit = 10}) async {
    try {
      final _params = {
        ...buildPage(page),
        ...buildLimit(limit),
      };

      final response = await getHttp('/category', params: _params);

      List<Category> results = response['results']
          .map<Category>((item) => Category.fromJson(item))
          .toList();

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
