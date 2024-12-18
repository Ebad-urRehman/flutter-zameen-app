import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/files/detail%20view/details_widgets.dart';
import 'package:zameen_flutter/theme_widget.dart';

void main() {
  runApp(const DetailsScreen());
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: themeProvider.currentTheme.primaryColor,
            title: const Text('Property Details'),
          ),
          body: const DetailsBanner(),
        ));
  }
}
