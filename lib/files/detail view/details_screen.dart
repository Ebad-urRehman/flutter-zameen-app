import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/constants/custom_widgets.dart';
import 'package:zameen_flutter/files/detail%20view/details_widgets.dart';
import 'package:zameen_flutter/theme_widget.dart';

class DetailsScreen extends StatelessWidget {
  String propertyName;
  String purpose;
  String area;
  String province;
  String city;
  String location;
  double widthRatio;
  double height;
  String latitude;
  String longitude;
  String pageUrl;
  String bedrooms;
  String baths;
  String agency;
  String agent;
  String price;

  DetailsScreen(
      {super.key,
      required this.propertyName,
      required this.purpose,
      required this.area,
      required this.province,
      required this.city,
      required this.location,
      required this.widthRatio,
      required this.height,
      required this.latitude,
      required this.longitude,
      required this.pageUrl,
      required this.bedrooms,
      required this.baths,
      required this.agency,
      required this.agent,
      required this.price});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Property Details',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: themeProvider.currentTheme.primaryColor,
            title: AppBarText(text: 'Property Details'),
          ),
          backgroundColor: themeProvider.currentTheme.secondaryColor,
          body: DetailsBanner(
              propertyName: propertyName,
              purpose: purpose,
              area: area,
              province: province,
              city: city,
              location: location,
              widthRatio: widthRatio,
              height: height,
              latitude: latitude,
              longitude: longitude,
              pageUrl: pageUrl,
              bedrooms: bedrooms,
              baths: baths,
              agency: agency,
              agent: agent,
              price: price),
        ));
  }
}
