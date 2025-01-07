import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/theme_widget.dart';

class AppBarText extends StatelessWidget {
  String text;
  AppBarText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);

    return Text(text,
        style: TextStyle(
            color: themeProvider.currentTheme.pureWhite,
            fontFamily: 'Itim',
            fontSize: 24,
            fontWeight: FontWeight.bold));
  }
}

class DetailHeader extends StatelessWidget {
  String text;
  DetailHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);

    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Itim',
        fontSize: 16,
        color: themeProvider.currentTheme.darkGreen,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class DetailText extends StatelessWidget {
  String text;
  DetailText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Itim',
        fontSize: 20,
        color: themeProvider.currentTheme.primaryColor,
      ),
    );
  }
}

class LatLongitudeText extends StatelessWidget {
  String latitude;
  String longitude;
  LatLongitudeText(
      {super.key, required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return Column(
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Latitude : ",
              style: TextStyle(
                  fontFamily: 'Itim',
                  fontSize: 16,
                  color: themeProvider.currentTheme.darkGreen,
                  fontWeight: FontWeight.bold)),
          TextSpan(
            text: latitude,
            style: TextStyle(
              fontFamily: 'Itim',
              fontSize: 16,
              color: themeProvider.currentTheme.primaryColor,
            ),
          )
        ])),
        const SizedBox(
          height: 10,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Longitude : ",
              style: TextStyle(
                  fontFamily: 'Itim',
                  fontSize: 16,
                  color: themeProvider.currentTheme.darkGreen,
                  fontWeight: FontWeight.bold)),
          TextSpan(
            text: longitude,
            style: TextStyle(
              fontFamily: 'Itim',
              fontSize: 16,
              color: themeProvider.currentTheme.primaryColor,
            ),
          )
        ])),
      ],
    );
  }
}

class CardHeader extends StatelessWidget {
  String text;
  CardHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);

    return Text(text,
        style: TextStyle(
            color: themeProvider.currentTheme.white,
            fontFamily: 'Itim',
            fontSize: 20));
  }
}

class CardTexts extends StatelessWidget {
  String area;
  String city;
  String location;
  String price;
  CardTexts(
      {super.key,
      required this.area,
      required this.city,
      required this.location,
      required this.price});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return Column(
      children: [
        Text(
          'Area : $area',
          style: TextStyle(
              color: themeProvider.currentTheme.white, fontFamily: 'Itim'),
        ),
        Text(
          'City : $city',
          style: TextStyle(
              color: themeProvider.currentTheme.white, fontFamily: 'Itim'),
        ),
        Text(
          'Location : $location',
          style: TextStyle(
              color: themeProvider.currentTheme.white, fontFamily: 'Itim'),
        ),
        Text(
          'Price : $price',
          style: TextStyle(
              color: themeProvider.currentTheme.white, fontFamily: 'Itim'),
        ),
      ],
    );
  }
}
