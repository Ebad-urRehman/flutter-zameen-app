import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/constants/app_images.dart';
import 'package:zameen_flutter/constants/custom_widgets.dart';
import 'package:zameen_flutter/files/Helpers/helper.dart';
import 'package:zameen_flutter/files/Maps/map_view.dart';
import 'package:zameen_flutter/files/cards/list_of_cards.dart';
import 'package:zameen_flutter/theme_widget.dart';

AppImages appImages = AppImages();

class DetailsBanner extends StatelessWidget {
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

  DetailsBanner(
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

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/${propertyName.replaceAll(' ', '_').toLowerCase()}.png'),
                      fit: BoxFit.cover)),
              child: Card(
                color: Colors.transparent,
                elevation: 10,
                child: SizedBox(
                    height: 200,
                    child: Center(
                      child: Text(
                        '$propertyName in $location',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Itim',
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: themeProvider.currentTheme.white),
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      DetailHeader(text: 'Province'),
                      DetailText(text: province)
                    ],
                  ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 2,
                ),
                Expanded(
                  child: Column(
                    children: [
                      DetailHeader(text: 'City'),
                      DetailText(text: city)
                    ],
                  ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 2,
                ),
                Expanded(
                    child: LatLongitudeText(
                  latitude: latitude,
                  longitude: longitude,
                )),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: themeProvider.currentTheme.white, width: 1),
                    borderRadius: BorderRadius.circular(8)),
                child: Card(
                    child: MapView(
                        latitude: latitude,
                        longitude: longitude,
                        propertyName: propertyName,
                        purpose: purpose,
                        city: city))),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1,
              child: RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: " ➡️ Location : ",
                  style: TextStyle(
                    fontFamily: 'Itim',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: location,
                  style: const TextStyle(
                      fontFamily: 'Itim', fontSize: 16, color: Colors.black),
                )
              ])),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      DetailHeader(text: 'Agency'),
                      DetailText(text: agency)
                    ],
                  ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 2,
                ),
                Expanded(
                  child: Column(
                    children: [
                      DetailHeader(text: 'Agency'),
                      DetailText(text: agent)
                    ],
                  ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 2,
                ),
                Expanded(
                  child: Column(
                    children: [
                      DetailHeader(text: 'URL'),
                      TextUrl(url: pageUrl, text: 'Click here'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      DetailHeader(text: 'Area'),
                      DetailText(text: area)
                    ],
                  ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 2,
                ),
                Expanded(
                  child: Column(
                    children: [
                      DetailHeader(text: 'Bedrooms'),
                      DetailText(text: bedrooms)
                    ],
                  ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 2,
                ),
                Expanded(
                  child: Column(
                    children: [
                      DetailHeader(text: 'Baths'),
                      DetailText(text: baths)
                    ],
                  ),
                ),
              ],
            ),
            ListOfCards(
              headerText: '  ➡️  Nearest to your location',
              widthRatio: 2.5,
              height: 225,
            ),
            ListOfCards(
              headerText: '  ➡️  Recommended for you',
              widthRatio: 2.5,
              height: 225,
            )
          ],
        ),
      ),
    );
  }
}
