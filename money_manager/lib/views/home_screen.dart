import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/settings_viewmodel.dart';
import 'incomes_screen.dart';
import 'expenses_screen.dart';
import 'summary_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [
    const SummaryScreen(),
    const IncomesScreen(),
    const ExpensesScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget bottomNavIcon(String assetPath) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Image.asset(
        assetPath,
        width: 30,
        height: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsViewModel>();
    final theme = settings.themeData;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: theme.primaryColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: theme.textColor,
        unselectedItemColor: theme.textColor.withOpacity(0.6),
        selectedLabelStyle: TextStyle(
          fontSize: 16,
          color: theme.textColor,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          color: theme.textColor.withOpacity(0.6),
        ),
        items: [
          BottomNavigationBarItem(
            icon: bottomNavIcon(theme.homeIcon),
            label: settings.getText('summary'),
          ),
          BottomNavigationBarItem(
            icon: bottomNavIcon(theme.plusIcon),
            label: settings.getText('income'),
          ),
          BottomNavigationBarItem(
            icon: bottomNavIcon(theme.minusIcon),
            label: settings.getText('expenses'),
          ),
          BottomNavigationBarItem(
            icon: bottomNavIcon(theme.settingsIcon),
            label: settings.getText('settingsTitle'),
          ),
        ],
      ),
    );
  }
}
