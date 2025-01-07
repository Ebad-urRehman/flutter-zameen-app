import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:zameen_flutter/constants/custom_widgets.dart';
import 'package:zameen_flutter/files/auth/authentication.dart';
import 'package:zameen_flutter/files/cards/list_of_cards.dart';
import 'package:zameen_flutter/files/home/home_widgets.dart';
import 'package:zameen_flutter/constants/app_images.dart';
import 'package:zameen_flutter/files/search/simple_query_result.dart';
import 'package:zameen_flutter/theme_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

AppImages appImages = AppImages();
bool _darkThemeColors = false;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Authentication().currentUser;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return Scaffold(
      appBar: AppBar(
        title: AppBarText(text: 'Zameen'),
        backgroundColor: themeProvider.currentTheme.primaryColor,
        actions: [DropDownCustomButton()],
      ),
      backgroundColor: themeProvider.currentTheme.secondaryColor,
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
              color: themeProvider.currentTheme.secondaryColor,
              child: Card(
                color: Colors.transparent,
                elevation: 5,
                child: CarouselSlider.builder(
                  itemCount: estateImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final url_image = estateImages[index];
                    final property_name =
                        '${estateImages[index][1]}' == 'Pent House'
                            ? 'Penthouse'
                            : '${estateImages[index][1]}';
                    return GestureDetector(
                        onTap: () {
                          Map queryParams = {
                            'property_type': [property_name]
                          };
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SimpleQueryResultScreen(
                                      queryParams: queryParams)));
                        },
                        child: buildImage(context, url_image, index));
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
                    child: GestureDetector(
                      onTap: () {
                        Map queryParams = {
                          'purpose': ['For Rent']
                        };
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SimpleQueryResultScreen(
                                    queryParams: queryParams)));
                      },
                      child: Card(
                        elevation: 5,
                        color: Colors.transparent,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2.4,
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
                        Map queryParams = {
                          'purpose': ['For Sale']
                        };
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SimpleQueryResultScreen(
                                    queryParams: queryParams)));
                      },
                      child: Card(
                        elevation: 5,
                        color: Colors.transparent,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2.4,
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
            ListOfCards(
                headerText: '  ➡️  Favorites', widthRatio: 2.5, height: 225),
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
  final themeProvider = Provider.of<ThemeManager>(context);

  return Stack(
    children: [
      Positioned.fill(
          child: Image.asset(
        urlImage[0],
        fit: BoxFit.fitWidth,
        color: Colors.black, // Dimmed overlay effect
        colorBlendMode: BlendMode.darken,
      )),
      Center(
        child: Card(
          child: Image.asset(
            urlImage[0],
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width * 2,
            color: themeProvider.currentTheme.secondaryColor.withOpacity(0.3),
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
  [appImages.houseImage, 'House'],
  [appImages.farmhouseImage, 'Farm House'],
  [appImages.roomImage, 'Room'],
  [appImages.flatImage, 'Flat'],
  [appImages.penthouseImage, 'Pent House'],
];
