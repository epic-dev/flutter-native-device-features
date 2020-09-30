import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_locations/helpers/db_helper.dart';
import 'package:flutter_locations/models/place.dart';
import '../helpers/locaion_helper.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Place findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void addPlace(String title, File image, PlaceLocation pickedLocation) async {
    final address = await LocationHelper.getPlaceAddress(pickedLocation.latitude, pickedLocation.longitude);
    final updatedLoc = PlaceLocation(pickedLocation.latitude, pickedLocation.longitude, address);
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      location: updatedLoc,
      image: image,
    );
    _items.add(newPlace);
    DbHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'loc_lat': pickedLocation.latitude,
      'loc_lng': pickedLocation.longitude,
      'address': address,
    });
    notifyListeners();
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DbHelper.getData('places');
    _items = dataList
        .map((item) => Place(
              id: item['id'],
              title: item['title'],
              image: File(item['image']),
              location: PlaceLocation(item['loc_lat'], item['loc_lng'], item['address']),
            ))
        .toList();
        notifyListeners();
  }
}
