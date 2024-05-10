import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class LocationUtil {
  static String generateLocationPreviewImage({
    double latitude = 0.0,
    double longitude = 0.0,
    String apiKey = '',
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude, $longitude&zoom=18&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$apiKey';
  }

  static Future<String> getAddressFrom(
    LatLng position,
    String key,
  ) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$key';

    final response = await http.get(Uri.parse(url));

    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
