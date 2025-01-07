import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/constants/app_colors.dart';
import 'package:zameen_flutter/files/store%20data/manage_share_preferences.dart';

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
  bool _isDarkTheme = getStringValue(key: 'theme') == 'true' ? true : false;

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    String strValue = _isDarkTheme == false ? 'false' : 'true';
    addStringValue(key: 'theme', value: strValue);
    notifyListeners();
  }

  dynamic get currentTheme => _isDarkTheme ? AppColorsDarkTheme() : AppColors();
}
