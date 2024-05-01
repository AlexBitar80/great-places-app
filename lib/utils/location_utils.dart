class LocationUtil {
  static String generateLocationPreviewImage({
    double latitude = 0.0,
    double longitude = 0.0,
    String apiKey = '',
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude, $longitude&zoom=18&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$apiKey';
  }
}
