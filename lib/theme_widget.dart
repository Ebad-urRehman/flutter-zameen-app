import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/constants/app_colors.dart';

class ThemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);

    return Row(children: [
      Icon(
        themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
      ),
      const Text('  Toggle Theme')
    ]);
  }
}

class ThemeManager extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  dynamic get currentTheme => _isDarkTheme ? AppColorsDarkTheme() : AppColors();
}
