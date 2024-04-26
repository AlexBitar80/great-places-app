import 'dart:io';

import 'package:flutter/material.dart';

import '../great_places.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      image: image,
      location: PlaceLocation(
        latitude: 0,
        longitude: 0,
        address: null,
      ),
    );

    _items.add(newPlace);
    notifyListeners();
  }
}
