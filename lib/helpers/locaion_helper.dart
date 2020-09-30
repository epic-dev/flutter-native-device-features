import 'dart:convert';
import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = '';

class LocationHelper {
  // static void

  static String generateLocationPreviewImage({double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=15&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
  static Future<String> getPlaceAddress(double lat, double lon) async  {
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lon&key=$GOOGLE_API_KEY';
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
