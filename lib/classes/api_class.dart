import 'dart:convert';

import 'package:http/http.dart' as http;

const openUrl = "https://api.openweathermap.org/data/2.5/weather";
const apiKey = "7fbb889e3cd628dc6a00f2d420a959b9";

class Api {
  Api({this.url});
  final url;
  Future<dynamic> getWetherData() async
  {
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    print(json);
    return json;
  }
}
