import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../great_places.dart';

class PlaceFormPage extends StatefulWidget {
  const PlaceFormPage({super.key});

  @override
  State<PlaceFormPage> createState() => _PlacesFormPageState();
}

class _PlacesFormPageState extends State<PlaceFormPage> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  late LatLng? _pickedPosition;

  bool isValidForm() {
    return _titleController.text.isNotEmpty &&
        _pickedImage != null &&
        _pickedPosition != null;
  }

  void selectImage(File pickedImage) {
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  void selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  void _submitForm() {
    if (!isValidForm()) return;

    Provider.of<GreatPlaces>(context, listen: false).addPlace(
      _titleController.text,
      _pickedImage!,
      _pickedPosition!,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo lugar'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(
                  16,
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Título',
                      ),
                      onChanged: (text) {
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 10),
                    ImageInput(
                      onSelectImage: selectImage,
                    ),
                    const SizedBox(height: 10),
                    LocationInput(
                      onSelectPosition: selectPosition,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              child: CupertinoButton(
                color: Theme.of(context).colorScheme.secondary,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 10),
                    Text('Adicionar lugar'),
                  ],
                ),
                onPressed: () {
                  isValidForm() ? _submitForm() : null;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
