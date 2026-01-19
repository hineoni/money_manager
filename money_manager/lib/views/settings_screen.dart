import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/settings_viewmodel.dart';
import '../models/app_language.dart';
import '../models/app_theme.dart';
import '../models/app_theme_data.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SettingsViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(vm.getText('settingsTitle')),
        centerTitle: true,
        elevation: 0,
        backgroundColor: vm.themeData.primaryColor,
        foregroundColor: vm.themeData.textColor,
      ),
      backgroundColor: vm.themeData.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          _SettingsRow(
            title: vm.getText('selectLanguage'),
            children: [
              _SettingsButton(
                text: vm.getText('russian'),
                isSelected: vm.language == AppLanguage.Russian,
                onTap: () => vm.setLanguage(AppLanguage.Russian),
                themeData: vm.themeData,
              ),
              _SettingsButton(
                text: vm.getText('english'),
                isSelected: vm.language == AppLanguage.English,
                onTap: () => vm.setLanguage(AppLanguage.English),
                themeData: vm.themeData,
              ),
            ],
          ),
          const SizedBox(height: 24),
          _SettingsRow(
            title: vm.getText('selectTheme'),
            children: [
              _SettingsButton(
                text: vm.getText('dark'),
                isSelected: vm.theme == AppTheme.Dark,
                onTap: () => vm.setTheme(AppTheme.Dark),
                themeData: vm.themeData,
              ),
              _SettingsButton(
                text: vm.getText('light'),
                isSelected: vm.theme == AppTheme.Light,
                onTap: () => vm.setTheme(AppTheme.Light),
                themeData: vm.themeData,
              ),
              _SettingsButton(
                text: vm.getText('pink'),
                isSelected: vm.theme == AppTheme.Pink,
                onTap: () => vm.setTheme(AppTheme.Pink),
                themeData: vm.themeData,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsRow({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children
              .map((child) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: child,
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _SettingsButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final AppThemeData themeData;

  const _SettingsButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.themeData,
  });

  @override
  Widget build(BuildContext context) {
    final Color buttonColor =
        isSelected ? themeData.selectedButtonColor : Colors.transparent;
    final Color textColor =
        isSelected ? themeData.selectedTextColor : themeData.textColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: themeData.textColor),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
