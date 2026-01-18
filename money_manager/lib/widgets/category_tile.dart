import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category.name),
      trailing:
          Icon(category.isIncome ? Icons.arrow_upward : Icons.arrow_downward),
    );
  }
}
