// ignore_for_file: non_constant_identifier_names

class PaginatedResponse<T> {
  final int count;
  final int page;
  final int num_pages;
  final List<T> results;

  PaginatedResponse({
    required this.count,
    required this.page,
    required this.num_pages,
    required this.results,
  });

  factory PaginatedResponse.empty() {
    return PaginatedResponse(count: 0, page: 0, num_pages: 0, results: []);
  }
}
