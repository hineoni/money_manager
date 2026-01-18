import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/transaction_service.dart';
import 'services/category_service.dart';
import 'viewmodels/transactions_viewmodel.dart';
import 'viewmodels/categories_viewmodel.dart';
import 'views/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => TransactionService()),
        Provider(create: (_) => CategoryService()),
        ChangeNotifierProvider(
          create: (context) =>
              TransactionsViewModel(context.read<TransactionService>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              CategoriesViewModel(context.read<CategoryService>()),
        ),
      ],
      child: MaterialApp(
        title: 'Money Manager',
        theme: ThemeData(
          fontFamily: 'Inter',
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
