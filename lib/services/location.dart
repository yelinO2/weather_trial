import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather.dart';
import 'package:http/http.dart' as http;

class Location {
  Future<Weather> getLocalWeather() async {
    bool serviceEnabled;
    LocationPermission permission;
    dynamic latitude;
    dynamic longitude;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = currentPosition.latitude.toString();
    longitude = currentPosition.longitude.toString();

    var apiKey = '6df4aceaa08dca18bda799f95a2e02ac';
    var url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var localWeater = Weather.fromRawJson(response.body);
      print('Here..........>>>>>>>');
      print(localWeater.main!.feelsLike);
      return localWeater;
    } else {
      throw Exception('Request fail with status: ${response.statusCode}');
    }
  }
}
