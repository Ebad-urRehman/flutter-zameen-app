import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/constants/app_images.dart';
import 'package:zameen_flutter/constants/app_colors.dart';
import 'package:zameen_flutter/theme_widget.dart';

AppImages appImages = AppImages();
AppColorsDarkTheme appColors = AppColorsDarkTheme();

class EstateCard extends StatelessWidget {
  const EstateCard({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 250,
        child: Card(
          color: themeProvider.currentTheme.darkGreen,
          child: Column(
            children: [
              Text(
                'House for Sale',
                style: TextStyle(color: appColors.white, fontFamily: 'Itim'),
              ),
              Image.asset(appImages.houseImage2),
              Column(
                children: [
                  Text(
                    'Area : 200 Marla',
                    style:
                        TextStyle(color: appColors.white, fontFamily: 'Itim'),
                  ),
                  Text(
                    'Province : Punjab',
                    style:
                        TextStyle(color: appColors.white, fontFamily: 'Itim'),
                  ),
                  Text(
                    'City : Lahore',
                    style:
                        TextStyle(color: appColors.white, fontFamily: 'Itim'),
                  ),
                  Text(
                    'Location : Near Sector A1',
                    style:
                        TextStyle(color: appColors.white, fontFamily: 'Itim'),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
