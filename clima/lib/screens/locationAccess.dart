import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class UserLocation {
  late double latitude;
  late double longitude;
  Future<void> getUserLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      final permissionStatus = await Permission.locationWhenInUse.status;
      if (permissionStatus == PermissionStatus.granted) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        latitude = position.latitude;
        longitude = position.longitude;
        print(position);
      } else {
        LocationPermission permission1 = await Geolocator.requestPermission();
      }
    } catch (e) {
      print(e);
    }
  }
}
