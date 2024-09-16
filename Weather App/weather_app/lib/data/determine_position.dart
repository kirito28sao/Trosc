import 'package:geolocator/geolocator.dart';

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error("Location Service are disabled");
  }
  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error("Location is denied");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error("Location is permanently denied");
  }
  return await Geolocator.getCurrentPosition();
}
