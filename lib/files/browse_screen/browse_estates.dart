import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/constants/custom_widgets.dart';
import 'package:zameen_flutter/files/cards/list_of_cards.dart';
import 'package:zameen_flutter/theme_widget.dart';

class BrowseEstates extends StatefulWidget {
  const BrowseEstates({super.key});

  @override
  State<BrowseEstates> createState() => _BrowseEstatesState();
}

class _BrowseEstatesState extends State<BrowseEstates> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: themeProvider.currentTheme.secondaryColor,
        appBar: AppBar(
          backgroundColor: themeProvider.currentTheme.primaryColor,
          title: AppBarText(text: 'Browse Estates'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListOfCards(
                headerText: '  ➡️  Favorites',
                widthRatio: 2.5,
                height: 225,
              ),
              ListOfCards(
                headerText: '  ➡️  Recommended',
                widthRatio: 1.5,
                height: 325,
              ),
              ListOfCards(
                headerText: '  ➡️  Nearest to your location',
                widthRatio: 2.5,
                height: 225,
              )
            ],
          ),
        ),
      ),
    );
  }
}
