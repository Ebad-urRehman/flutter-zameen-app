import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/constants/app_images.dart';
import 'package:zameen_flutter/constants/app_colors.dart';
import 'package:zameen_flutter/files/detail%20view/details_screen.dart';
import 'package:zameen_flutter/theme_widget.dart';

AppImages appImages = AppImages();
AppColorsDarkTheme appColors = AppColorsDarkTheme();

class EstateCard extends StatelessWidget {
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

  EstateCard(
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
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(
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
                  price: price)),
        )
      },
      child: Container(
          width: MediaQuery.of(context).size.width / widthRatio,
          height: height,
          child: Card(
            color: themeProvider.currentTheme.darkGreen,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text(
                    '$propertyName $purpose',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: appColors.white,
                        fontFamily: 'Itim',
                        fontSize: 20),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Image.asset(
                        '${propertyName.replaceAll(' ', '_').toLowerCase()}.png'),
                  ),
                  Column(
                    children: [
                      Text(
                        'Area : $area',
                        style: TextStyle(
                            color: appColors.white, fontFamily: 'Itim'),
                      ),
                      Text(
                        'Province : $province',
                        style: TextStyle(
                            color: appColors.white, fontFamily: 'Itim'),
                      ),
                      Text(
                        'City : $city',
                        style: TextStyle(
                            color: appColors.white, fontFamily: 'Itim'),
                      ),
                      Text(
                        'Location : $location',
                        style: TextStyle(
                            color: appColors.white, fontFamily: 'Itim'),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
