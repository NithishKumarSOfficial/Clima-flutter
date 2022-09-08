import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apiKey='xnggbCPnhedxc1b7xuf8feNzBeu7Ugx6';
const openWeatherMapUrl='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName)async{

    NetworkHelper networkhelper= NetworkHelper('$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric');
    var weatherData=await networkhelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather()async{
    Location location=Location();
    await location.getCurrentLocation();
    NetworkHelper networkhelper=NetworkHelper('$openWeatherMapUrl?lat=${location.longitude}&lon=${location.latitude}&appid=$apiKey&units=metric');
    var weatherData=await networkhelper.getData();
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