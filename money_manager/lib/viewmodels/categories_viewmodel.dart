import 'package:flutter/material.dart';
import '../models/category.dart';
import '../services/category_service.dart';

class CategoriesViewModel extends ChangeNotifier {
  final CategoryService _service;

  CategoriesViewModel(this._service);

  List<Category> get categories => _service.getAll();

  void addCategory(Category category) {
    _service.add(category);
    notifyListeners();
  }
}
