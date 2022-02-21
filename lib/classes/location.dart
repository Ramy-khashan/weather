import 'package:geolocator/geolocator.dart';

class Location {
 late double lan;
 late double long;
  Future<void> getLocation() async {
    Position position = await _determinePosition();
    lan = position.latitude;
    long = position.longitude;
  }

 Future<Position> _determinePosition() async {
   LocationPermission permission = await Geolocator.checkPermission();
   if (permission == LocationPermission.denied) {
     permission = await Geolocator.requestPermission();
     if (permission == LocationPermission.denied) {
       return Future.error('Location permissions are denied');
     }
   }
   return await Geolocator.getCurrentPosition();
 }
}
