import 'package:permission_handler/permission_handler.dart';

class GetLocationPermissionUseCase{
   Future<bool> execute() async {
    final status = await Permission.location.request();
    return status.isGranted;
  }
}