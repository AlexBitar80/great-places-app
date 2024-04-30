import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? previewImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: previewImageUrl == null
              ? const Text('No Location Chosen')
              : Image.network(
                  previewImageUrl ?? '',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(
              child: const Row(
                children: [
                  Icon(Icons.location_on),
                  Text('Localização Atual'),
                ],
              ),
              onPressed: () {},
            ),
            TextButton(
              child: const Row(
                children: [
                  Icon(Icons.map),
                  Text('Selecionar no Mapa'),
                ],
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
