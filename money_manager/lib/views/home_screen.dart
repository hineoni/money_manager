import 'package:flutter/material.dart';
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
    SummaryScreen(),
    IncomesScreen(),
    ExpensesScreen(),
    SettingsScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget bottomNavIcon(String asset) {
    return Padding(
      padding: const EdgeInsets.only(top: 6), 
      child: Image.asset(
        asset,
        width: 30,
        height: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontSize: 16),
          unselectedLabelStyle: const TextStyle(fontSize: 14),
          items: [
            BottomNavigationBarItem(
              icon: bottomNavIcon('assets/icons/home.png'),
              label: 'Общее',
            ),
            BottomNavigationBarItem(
              icon: bottomNavIcon('assets/icons/plus.png'),
              label: 'Доходы',
            ),
            BottomNavigationBarItem(
              icon: bottomNavIcon('assets/icons/minus.png'),
              label: 'Расходы',
            ),
            BottomNavigationBarItem(
              icon: bottomNavIcon('assets/icons/settings.png'),
              label: 'Настройки',
            ),
          ],
        ),
      ),
    );
  }
}
