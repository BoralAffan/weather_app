import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/src/features/weather/data/models/user_location/user_location_model.dart';

class GetDeviceLocationUseCase{
   Future<UserLocation> execute() async {
    final position = await Geolocator.getCurrentPosition(
      
        desiredAccuracy: LocationAccuracy.high);
     final placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude);
    final city = placemarks.first.locality ?? 'Unknown';
    return UserLocation(city: city, latitude: position.latitude, longitude: position.longitude);
  }
}