import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_locations/provider/places.dart';
import 'package:flutter_locations/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<Places>(
              builder: (ctx, places, _) => Center(
          child: places.items.length > 0
          ? ListView.builder(
            itemCount: places.items.length,
            itemBuilder: (ctx, i) {
              return ListTile(
                leading: CircleAvatar(backgroundImage: FileImage(places.items[i].image),),
                title: Text(places.items[i].title),
                onTap: () {
                  
                },
              );
            },
          )
          : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
