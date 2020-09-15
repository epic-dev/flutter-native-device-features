import 'package:flutter/material.dart';
import 'package:flutter_locations/provider/places.dart';
import 'package:flutter_locations/screens/add_place_screen.dart';
import 'package:flutter_locations/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Places(),
      child: MaterialApp(
        title: 'Great Places!',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
        } ,
      ),
    );
  }
}
