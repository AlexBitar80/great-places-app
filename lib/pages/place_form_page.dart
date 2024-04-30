import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  void selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitForm() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false).addPlace(
      _titleController.text,
      _pickedImage!,
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
                    ),
                    const SizedBox(height: 10),
                    ImageInput(
                      onSelectImage: selectImage,
                    ),
                    const SizedBox(height: 10),
                    const LocationInput(),
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
                onPressed: () => _submitForm(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
