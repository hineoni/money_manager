import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/transaction_service.dart';
import 'services/category_service.dart';
import 'viewmodels/transactions_viewmodel.dart';
import 'viewmodels/categories_viewmodel.dart';
import 'viewmodels/settings_viewmodel.dart';
import 'models/app_theme.dart';
import 'models/app_theme_data.dart';
import 'models/app_theme_list.dart';
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
        ChangeNotifierProvider(
          create: (_) => SettingsViewModel(),
        ),
      ],
      child: Consumer<SettingsViewModel>(
        builder: (context, settings, _) {
          final themeData = settings.themeData; // AppThemeData

          return MaterialApp(
            title: 'Money Manager',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              fontFamily: 'Inter',
              scaffoldBackgroundColor: themeData.backgroundColor,
              appBarTheme: AppBarTheme(
                backgroundColor: themeData.primaryColor,
                foregroundColor: themeData.textColor,
              ),
              colorScheme: ColorScheme.fromSeed(
                seedColor: themeData.primaryColor,
                brightness: themeData.brightness,
              ),
              textTheme: TextTheme(
                bodyMedium: TextStyle(color: themeData.textColor),
                bodyLarge: TextStyle(color: themeData.textColor),
              ),
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
