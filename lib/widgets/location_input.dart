import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart';

import '../great_places.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? previewImageUrl;

  final apiKey = dotenv.env['GOOGLE_API_KEY']!;

  Future<void> _getCurrentUserLocation() async {
    final locationData = await Location().getLocation();

    final staticMapImageUrl = LocationUtil.generateLocationPreviewImage(
      latitude: locationData.latitude ?? 0.0,
      longitude: locationData.longitude ?? 0.0,
      apiKey: apiKey,
    );

    setState(() {
      previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> selectOnMap() async {
    final LatLng selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const MapPage(),
      ),
    );

    // if (selectedLocation) {
    //   return;
    // }

    print(selectedLocation.latitude);
  }

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
              ? const Text('Localização não informada.')
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
              onPressed: _getCurrentUserLocation,
              child: const Row(
                children: [
                  Icon(Icons.location_on),
                  Text('Localização Atual'),
                ],
              ),
            ),
            TextButton(
              onPressed: selectOnMap,
              child: const Row(
                children: [
                  Icon(Icons.map),
                  Text('Selecionar no Mapa'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
