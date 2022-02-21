import 'package:flutter/material.dart';

import '../../classes/api_class.dart';
import '../../classes/sendlocation.dart';
import '../mainpage/view.dart';

class SearchController {
  TextEditingController city = TextEditingController();

  Api api = Api();
  String cityImg = "images/city.jpeg";

  Future<void> getLocation(context) async {
    WeatherModel weatherModel = WeatherModel();
    print("start");
    var weatherData = await weatherModel.getlocationWeather();

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => MainPageScreen(
                  data: weatherData,
                )),
        (route) => false);
  }

  Future<void> getCity(context) async {
    if (city.text.isNotEmpty) {
      Api api = Api(url: "$openUrl?q=${city.text}&appid=$apiKey&units=metric");
      var weatherData = await api.getWetherData();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => MainPageScreen(
                    data: weatherData,
                  )),
          (route) => false);
    }
  }
}
