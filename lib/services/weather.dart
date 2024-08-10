import 'package:clima2/services/location.dart';
import 'package:clima2/services/networking.dart';


const apiKey= 'd54c8a156dccf73719797400d0136e12';
class WeatherModel{

  Future getCityWeather(String cityName)async{
   var url= 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
   NetworkHelper networkHelper=NetworkHelper(url);
  var weatherData= await networkHelper.getData();
   return weatherData;
  }

  Future<dynamic> getLocationWeather()async{
    //current location object
    Location location= Location();
    await location.getCurrentLocation();

    //location data object
    NetworkHelper networkHelper= NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
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