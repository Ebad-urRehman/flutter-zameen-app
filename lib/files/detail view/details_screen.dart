import 'package:flutter/material.dart';
import 'package:zameen_flutter/files/detail%20view/details_widgets.dart';

void main() {
  runApp(const DetailsScreen());
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: appColors.primaryColor,
            title: Text('Property Details'),
          ),
          body: DetailsBanner(),
        ));
  }
}
