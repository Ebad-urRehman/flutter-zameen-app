import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zameen_flutter/files/store%20data/manage_share_preferences.dart';

class FavouritesIcon extends StatefulWidget {
  String iconStatus;
  List record;

  FavouritesIcon({super.key, required this.iconStatus, required this.record});

  @override
  State<FavouritesIcon> createState() => _FavouritesIconState();
}

class _FavouritesIconState extends State<FavouritesIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: widget.iconStatus == 'off'
          ? const Icon(Icons.star_border_outlined, color: Colors.white)
          : const Icon(
              Icons.star,
              color: Colors.amberAccent,
            ),
      onPressed: () async {
        List favouritesList = await getFavourites();
        if (widget.iconStatus == 'off') {
          if (!favouritesList.contains(widget.record)) {
            favouritesList.add(widget.record);
            updateFavourites(favouritesList);
            setState(() {
              widget.iconStatus = 'on';
            });
          }
        } else {
          favouritesList.removeWhere(
              (fav) => jsonEncode(fav) == jsonEncode(widget.record));

          updateFavourites(favouritesList);
          print(favouritesList);
          setState(() {
            widget.iconStatus = 'off';
          });
        }
      },
    );
  }
}
