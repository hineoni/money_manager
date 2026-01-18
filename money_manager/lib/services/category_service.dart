import '../models/category.dart';

class CategoryService {
  final List<Category> _categories = [];

  List<Category> getAll() => _categories;

  void add(Category category) {
    _categories.add(category);
  }
}
