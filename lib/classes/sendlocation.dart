
import 'api_class.dart';
import 'location.dart';

class WeatherModel {
  Future<dynamic> getlocationWeather() async {
    double latitude;
    double longtitude;
    Location location = Location();
    await location.getLocation();
    latitude = location.lan;
    longtitude = location.long;
    print(latitude);
    print(longtitude);
    Api network = Api(
        url:
        "$openUrl?lat=$latitude&lon=$longtitude&appid=$apiKey&units=metric");
    var weatherData = await network.getWetherData();
    return weatherData;
  }
}