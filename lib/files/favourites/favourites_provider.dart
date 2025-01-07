import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavouritesProvider with ChangeNotifier {
  List<dynamic> _favourites = [];

  List<dynamic> get favourites => _favourites;

  FavouritesProvider() {
    loadFavourites();
  }

  Future<void> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('favourites');
    _favourites = jsonString != null ? jsonDecode(jsonString) : [];
    notifyListeners();
  }

  Future<void> toggleFavourite(dynamic record) async {
    bool isFavourite =
        _favourites.any((fav) => jsonEncode(fav) == jsonEncode(record));
    if (isFavourite) {
      _favourites.removeWhere((fav) => jsonEncode(fav) == jsonEncode(record));
    } else {
      _favourites.add(record);
    }
    final prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(_favourites);
    await prefs.setString('favourites', jsonString);
    notifyListeners();
  }
}
