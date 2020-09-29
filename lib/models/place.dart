import 'package:flutter/material.dart';
import 'dart:io';

class PlaceLocation {
  final double _latitude;
  final double _longitude;
  final String _address;

  const PlaceLocation(@required this._latitude, @required this._longitude, this._address);

  double get latitude {
    return _latitude;
  }

  double get longitude {
    return _longitude;
  }

  String get address {
    return _address;
  }
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}