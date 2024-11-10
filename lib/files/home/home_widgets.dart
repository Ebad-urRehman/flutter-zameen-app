import 'package:flutter/material.dart';
import 'package:zameen_flutter/constants/app_images.dart';
import 'package:zameen_flutter/constants/app_colors.dart';
import 'package:zameen_flutter/files/predictions/prediction_screen.dart';

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
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Itim'),
                  textAlign: TextAlign.left,
                ))),
      ),
    );
  }
}
