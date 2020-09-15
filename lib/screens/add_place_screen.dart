import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_locations/provider/places.dart';
import 'package:flutter_locations/widgets/imag_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  TextEditingController _titleController = TextEditingController();
  File _pcikedImage;

  void _selectImage(File pickedImage) {
    _pcikedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pcikedImage == null) {
      return;
    }
    Provider.of<Places>(context, listen: false).addPlace(_titleController.text, _pcikedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ImageInput(_selectImage),
                    // TextField(
                    //   controller: _titleController,
                    //   decoration: InputDecoration(
                    //     labelText: 'Image',
                    //   ),
                    // ),
                    // TextField(),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
            onPressed: _savePlace,
            icon: Icon(Icons.add),
            label: Text('Add Place'),
          ),
        ],
      ),
    );
  }
}
