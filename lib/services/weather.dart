import 'package:clima/services/networking.dart';
import "package:clima/services/Location.dart";
const apiKey = "21b1f601dd25c40ed9df528fa461c305";
const openWeatherMapURL = "https://api.openweathermap.org/data/2.5/weather";
class WeatherModel {
//https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
  double latitude = 0.0;
  double longitude = 0.0;

  Future<dynamic> getCityWeather(String cityName) async{

    // var url2 = Uri.parse("$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric");
    NetworkHelper myHelper = new NetworkHelper("$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric");
    var weatherData = await myHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = new Location();

    await location.getCurrentLocation();

    latitude = location.latiude;
    longitude = location.longitude;

    NetworkHelper myHelper = new NetworkHelper(
        '$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var weatherData = await myHelper.getData();

    return weatherData;

  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
