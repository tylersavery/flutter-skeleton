// ignore_for_file: constant_identifier_names

const SITE_TITLE = "Flutter Skeleton";
const DEFAULT_TITLE = "Dev";
const DEFAULT_DESCRIPTION = "This is the description";
const DEFAULT_KEYWORDS = ["flutter", "dev"];

class SeoPage {
  final String path;
  final String name;
  final String title;
  final String description;
  final List<String> keywords;
  final String? apiUrl;
  final List<String>? responseToTitle;
  final List<String>? responseToImage;

  const SeoPage({
    required this.path,
    required this.name,
    this.title = DEFAULT_TITLE,
    this.description = DEFAULT_DESCRIPTION,
    this.keywords = DEFAULT_KEYWORDS,
    this.apiUrl,
    this.responseToTitle,
    this.responseToImage,
  });
}

const SEO_ROUTES = [
  SeoPage(
    path: 'dashboard/categories',
    name: 'categories',
    title: "Categories",
    description: "List of categories",
    keywords: ['category', 'love'],
  ),
  SeoPage(
    path: 'dashboard/users',
    name: 'users',
    title: "Users List",
    description: "List of users",
  ),
  SeoPage(
    path: 'dashboard/users/:id',
    name: 'userDetail',
    title: "User Detail",
    description: "User Detail",
    apiUrl: "https://service.storyplace.com/api/user/:id",
    responseToTitle: ['username'],
  ),
  SeoPage(
    path: 'dashboard/categories/:id',
    name: 'categoryDetail',
    title: "Category Detail",
    description: "Category Detail",
    apiUrl: "https://service.storyplace.com/api/user/:id",
    responseToTitle: ['name'],
    responseToImage: ['image', 'asset', 'url'],
  ),
];
