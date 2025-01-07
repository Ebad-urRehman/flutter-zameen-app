import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/constants/app_images.dart';
import 'package:zameen_flutter/constants/app_colors.dart';
import 'package:zameen_flutter/files/auth/authentication.dart';
import 'package:zameen_flutter/files/browse_screen/browse_estates.dart';
import 'package:zameen_flutter/files/predictions/prediction_screen.dart';
import 'package:zameen_flutter/files/search/search.dart';
import 'package:zameen_flutter/files/store%20data/manage_share_preferences.dart';
import 'package:zameen_flutter/theme_widget.dart';

AppImages appImages = AppImages();
AppColors appColors = AppColors();

class verticalCardLarge extends StatelessWidget {
  String backgroundImageUrl;
  String cardText;
  String redirectUrl;
  verticalCardLarge(
      {super.key,
      required this.backgroundImageUrl,
      required this.cardText,
      required this.redirectUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImageUrl),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            width: 3,
            color: Colors.black,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, redirectUrl);
        },
        child: Card(
            elevation: 5,
            color: Colors.transparent,
            child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 100,
                child: Text(
                  '${cardText}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Itim'),
                  textAlign: TextAlign.left,
                ))),
      ),
    );
  }
}

class DropDownCustomButton extends StatelessWidget {
  const DropDownCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);

    Future<void> signOut() async {
      await Authentication().signOut();
    }

    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 'EstateBrowser',
            child: const Row(children: [
              Icon(Icons.location_searching_outlined),
              Text('  Browse Estates')
            ]),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BrowseEstates()))
            },
          ),
          PopupMenuItem(
              value: 'Price Predictor',
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PricePredictorPage()))
                  },
              child: const Row(children: [
                Icon(Icons.auto_graph_outlined),
                Text('  Predict Prices')
              ])),
          PopupMenuItem(
              value: 'Search',
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchFilterExample()))
                  },
              child: const Row(
                  children: [Icon(Icons.search), Text('  Search Estates')])),
          PopupMenuItem(
              value: 'theme',
              onTap: () {
                themeProvider.toggleTheme();
              },
              child: ThemeWidget()),
          PopupMenuItem(
              value: 'theme',
              child: Text(getStringValue(key: 'username').toString())),
          PopupMenuItem(
              value: 'Logout',
              onTap: () => {signOut()},
              child:
                  const Row(children: [Icon(Icons.logout), Text('  Logout')]))
        ];
      },
      iconColor: Colors.white,
    );
  }
}
