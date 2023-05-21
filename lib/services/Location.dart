import 'package:geolocator/geolocator.dart';

class Location {
  double latiude = 0;
  double longitude = 0;

  Future<void> getCurrentLocation() async {
    try {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

    latiude=position.latitude;
    longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

}
