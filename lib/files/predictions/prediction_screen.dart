import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/files/predictions/prediction_widgets.dart';
import 'package:zameen_flutter/theme_widget.dart';

class PricePredictorPage extends StatelessWidget {
  const PricePredictorPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: themeProvider.currentTheme.primaryColor,
            title: const Text('Predict house prices',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Itim', fontSize: 24)),
          ),
          backgroundColor: themeProvider.currentTheme.secondaryColor,
          body: const PredictionUi()),
    );
  }
}
