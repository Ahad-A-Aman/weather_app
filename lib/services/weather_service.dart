import 'package:http/http.dart' as http;
import 'package:insta_app/model/weather_model.dart';
import 'dart:convert';

class WeatherService {
  static const BASE_URL = 'https://home.openweathermap.org/api_keys';
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
    final response =
        await http.get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
