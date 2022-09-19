import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

class API {
  Future<Weather> getSearchWeather(String city) async {
    var apiKey = '6df4aceaa08dca18bda799f95a2e02ac';
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var weather = Weather.fromRawJson(response.body);
      print(weather.sys!.country);
      return weather;
    } else {
      throw Exception('Request fail with status: ${response.statusCode}');
    }
  }
}
