import 'package:flutter/material.dart';
import 'package:flutter_locations/models/place.dart';
import 'package:flutter_locations/provider/places.dart';
import 'package:flutter_locations/screens/map_screen.dart';
import 'package:provider/provider.dart';
class PlaceDetailsScreen extends StatelessWidget {

    static const routeName = '/place-details';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlace = Provider.of<Places>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(title: Text(selectedPlace.title)),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(selectedPlace.image, fit: BoxFit.cover, width: double.infinity,)
          ),
          SizedBox(height: 10,),
          Text(selectedPlace.location.address),
          SizedBox(height: 10,),
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MapScreen(initialLocation: selectedPlace.location,)));
            },
            child: Text('View on Map'))
        ]),
    );
  }
}