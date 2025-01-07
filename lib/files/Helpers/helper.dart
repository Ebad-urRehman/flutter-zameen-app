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

Map addQueryParams({required queryParams, required filter}) {
  List<String> parts = filter.split(" ");
  String queryColumn = parts[0].toLowerCase();
  String queryValue = parts.sublist(1).join(" ");
  if (queryParams.containsKey(queryColumn)) {
    queryColumn = queryColumn.toLowerCase();
    print(queryColumn);
    queryParams[queryColumn].add(queryValue);
  } else {
    queryParams[queryColumn] = [queryValue];
  }
  return queryParams;
}

Map removeQueryParams({required queryParams, required filter}) {
  List<String> parts = filter.split(" ");
  String queryColumn = parts[0].toLowerCase();
  String queryValue = parts.sublist(1).join(" ");
  if (queryParams.containsKey(queryColumn)) {
    if (queryParams[queryColumn].length <= 1) {
      queryParams.remove(queryColumn);
    } else {
      queryParams[queryColumn].remove(queryValue);
    }
  }
  return queryParams;
}

Map updateQueryParamsValue(
    {required queryColumn, required queryParams, required queryValue}) {
  queryParams[queryColumn] = queryValue;
  return queryParams;
}
