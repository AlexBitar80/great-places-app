import 'dart:io';
import 'package:flutter/material.dart';
import 'package:great_places/pages/map_page.dart';

import '../models/place.dart';

class PlaceDetailPage extends StatelessWidget {
  const PlaceDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Place? place = ModalRoute.of(context)!.settings.arguments as Place?;

    void navigateToMap() {
      Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (ctx) => MapPage(
            title: 'Localização',
            initialLocation: place!.location!,
            isReadOnly: true,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          place?.title.toString() ?? '',
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 240,
            child: Image.file(
              place?.image ?? File(''),
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              place?.location?.address ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () => navigateToMap(),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.map),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Ver no Mapa',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
