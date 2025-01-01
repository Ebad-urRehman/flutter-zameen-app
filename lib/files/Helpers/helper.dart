import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zameen_flutter/theme_widget.dart';

class TextUrl extends StatelessWidget {
  String url;
  String text;

  TextUrl({Key? key, required this.url, required this.text}) : super(key: key);
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);

    return GestureDetector(
      onTap: () => _launchUrl(url),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Itim',
          fontSize: 20,
          color: themeProvider.currentTheme.primaryColor,
        ),
      ),
    );
  }
}
