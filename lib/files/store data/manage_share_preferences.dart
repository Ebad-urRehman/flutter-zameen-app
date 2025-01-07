import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<void> saveAccountInfo({userName, email}) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', 'Ebad-urRehman');
  await prefs.setInt('age', 25);
  await prefs.setBool('isLoggedIn', true);
  await prefs.setDouble('height', 5.9);
}

Future<List<dynamic>> getFavourites() async {
  final prefs = await SharedPreferences.getInstance();
  String? jsonString = prefs.getString('favourites');

  if (jsonString != null) {
    return jsonDecode(jsonString);
  } else {
    return [];
  }
}

Future<void> updateFavourites(List<dynamic> favouritesList) async {
  final prefs = await SharedPreferences.getInstance();
  String jsonString = jsonEncode(favouritesList);
  await prefs.setString('favourites', jsonString);
}

addStringValue({required key, required value}) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

getStringValue({required key}) async {
  final prefs = await SharedPreferences.getInstance();
  return await prefs.getString(key);
}
