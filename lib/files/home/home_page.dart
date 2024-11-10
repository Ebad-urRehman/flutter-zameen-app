import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:zameen_flutter/files/detail%20view/details_screen.dart';
import 'package:zameen_flutter/files/home/home_widgets.dart';
import 'package:zameen_flutter/files/predictions/prediction_screen.dart';
import 'package:zameen_flutter/constants/app_images.dart';
import 'package:zameen_flutter/constants/app_colors.dart';
import 'package:zameen_flutter/files/cards/cards_widget.dart';

AppImages appImages = AppImages();
AppColors appColors = AppColors();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Zameen',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Itim',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: appColors.primaryColor,
        actions: [
          CircleAvatar(
            radius: 20,
            child: IconButton(
              icon: Icon(Icons.person_2_rounded),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ),
        ],
      ),
      backgroundColor: appColors.secondaryColor,
      body: SafeArea(
          child: Expanded(
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 25,
            ),
            verticalCardLarge(
              backgroundImageUrl: appImages.estateImage,
              cardText: 'Browse Estates',
              redirectUrl: '/browseestates',
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              color: appColors.secondaryColor,
              child: Card(
                color: Colors.transparent,
                elevation: 5,
                child: CarouselSlider.builder(
                  itemCount: estateImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final url_image = estateImages[index];
                    return buildImage(context, url_image, index);
                  },
                  options: CarouselOptions(
                      height: 250, autoPlay: true, enlargeCenterPage: true),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(appImages.rentImage),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          width: 3,
                          color: Colors.black,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Card(
                      elevation: 5,
                      color: Colors.transparent,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2.25,
                        height: 100,
                        child: const Text('For rent',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'Itim',
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(appImages.saleImage),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(width: 3, color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DetailsScreen()));
                      },
                      child: Card(
                        elevation: 5,
                        color: Colors.transparent,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2.25,
                          height: 100,
                          child: const Text(
                            'For Sale',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'Itim',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            verticalCardLarge(
              backgroundImageUrl: appImages.predictpriceImage,
              cardText: 'Price Predictor',
              redirectUrl: '/pricepredictor',
            ),
            const SizedBox(
              height: 25,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Expanded(
                child: Row(
                  children: [
                    EstateCard(),
                    EstateCard(),
                    EstateCard(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ]),
        ),
      )),
    );
  }
}

Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      effect:
          const ExpandingDotsEffect(dotWidth: 15, activeDotColor: Colors.blue),
      count: estateImages.length,
    );

Widget buildImage(context, List urlImage, int index) {
  return Stack(
    children: [
      Positioned.fill(
          child: Image.asset(
        urlImage[0],
        fit: BoxFit.fitWidth,
        color: Colors.black.withOpacity(0.3), // Dimmed overlay effect
        colorBlendMode: BlendMode.darken,
      )),
      Center(
        child: Card(
          child: Image.asset(
            urlImage[0],
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width * 2,
            color: appColors.secondaryColor.withOpacity(0.3),
            colorBlendMode: BlendMode.darken,
          ),
        ),
      ),
      Center(
          child: Text(
        urlImage[1],
        style: const TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
            fontFamily: 'Itim'),
      ))
    ],
  );
}

int activeIndex = 0;
List<List> estateImages = [
  [appImages.houseImage2, 'House'],
  [appImages.farmhouseImage2, 'Farm House'],
  [appImages.roomImage2, 'Room'],
  [appImages.flatImage2, 'Flat'],
  [appImages.penthouseImage2, 'Pent House'],
];
