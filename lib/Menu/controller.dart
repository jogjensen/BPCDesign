import 'dart:convert';

import 'package:designbpc/api/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';

class Controller {
  Future<void> locationService() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionLocation;
    LocationData _locData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }
    if (!_serviceEnabled) {
      return;
    }

    _permissionLocation = await location.hasPermission();
    if (_permissionLocation == PermissionStatus.denied) {
      _permissionLocation = await location.requestPermission();
    }
    if (_permissionLocation != PermissionStatus.granted) {
      return;
    }
    _locData = await location.getLocation();
    if (_permissionLocation == PermissionStatus.granted) {
      var response = await APIService()
          .updateLocation(_locData.latitude, _locData.longitude);

      var body = jsonDecode(response.body);
      var data = body['data'];
      var message = data['message'];
      var code = data['code'];
      if (code == 200) {
        Fluttertoast.showToast(
          msg: "$message",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Something went wrong...",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
      }
    }
  }
}
