import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/constants/app_images.dart';
import 'package:zameen_flutter/files/Maps/map_view.dart';
import 'package:zameen_flutter/theme_widget.dart';

AppImages appImages = AppImages();

class DetailsBanner extends StatelessWidget {
  const DetailsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('house2.png'), fit: BoxFit.cover)),
            child: const Card(
              color: Colors.transparent,
              elevation: 10,
              child: SizedBox(height: 200, child: Text('House in Location')),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Province',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 16,
                      color: themeProvider.currentTheme.darkGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Punjab',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 20,
                      color: themeProvider.currentTheme.primaryColor,
                    ),
                  )
                ],
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 2,
              ),
              Column(
                children: [
                  Text(
                    'City',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 16,
                      color: themeProvider.currentTheme.darkGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Lahore',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 20,
                      color: themeProvider.currentTheme.primaryColor,
                    ),
                  )
                ],
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 2,
              ),
              Column(
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
                      text: "2234",
                      style: TextStyle(
                        fontFamily: 'Itim',
                        fontSize: 16,
                        color: themeProvider.currentTheme.secondaryColor,
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
                      text: "3324",
                      style: TextStyle(
                        fontFamily: 'Itim',
                        fontSize: 16,
                        color: themeProvider.currentTheme.secondaryColor,
                      ),
                    )
                  ])),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(width: double.infinity, height: 200, child: MapView()),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: RichText(
                text: const TextSpan(children: [
              TextSpan(
                text: "Location : ",
                style: TextStyle(
                  fontFamily: 'Itim',
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: "Located near sector A1",
                style: TextStyle(
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
              Column(
                children: [
                  Text(
                    'Agency',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 16,
                      color: themeProvider.currentTheme.darkGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Unknown',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 20,
                      color: themeProvider.currentTheme.primaryColor,
                    ),
                  )
                ],
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 2,
              ),
              Column(
                children: [
                  Text(
                    'Agent',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 16,
                      color: themeProvider.currentTheme.darkGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Unknown',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 20,
                      color: themeProvider.currentTheme.primaryColor,
                    ),
                  )
                ],
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 2,
              ),
              Column(
                children: [
                  Text(
                    'URL',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 16,
                      color: themeProvider.currentTheme.darkGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Click here',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 20,
                      color: themeProvider.currentTheme.primaryColor,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Area',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 16,
                      color: themeProvider.currentTheme.darkGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '40 Marla',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 20,
                      color: themeProvider.currentTheme.primaryColor,
                    ),
                  )
                ],
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 2,
              ),
              Column(
                children: [
                  Text(
                    'Bedrooms',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 16,
                      color: themeProvider.currentTheme.darkGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '4',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 20,
                      color: themeProvider.currentTheme.primaryColor,
                    ),
                  )
                ],
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 2,
              ),
              Column(
                children: [
                  Text(
                    'Baths',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 16,
                      color: themeProvider.currentTheme.darkGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '2',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 20,
                      color: themeProvider.currentTheme.primaryColor,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
