import 'package:flutter/material.dart';
import 'package:location/location.dart';

class SettingsProvider extends ChangeNotifier {
  var location = Location();
  String locationMessage = "";
  bool _isRequestingPermission = false;


  Future<void> getLocation() async {
    bool locationPermissionGranted = await _getLocationPermission();
    if (!locationPermissionGranted) {


      locationMessage = "Location permission denied";
      notifyListeners();

    }
    bool locationServiceEnabled = await _locationServiceEnabled();
    if (!locationServiceEnabled) {
      locationMessage = "";
      notifyListeners();
      return;
      }
    locationMessage = '';
    notifyListeners();
     LocationData locationData = await location.getLocation();
     locationMessage = ' you are at ${locationData.latitude}, ${locationData.longitude}';
    }


  Future<bool> _locationServiceEnabled() async {

    bool locationServiceEnabled = await location.serviceEnabled();
    if (!locationServiceEnabled)  {
      locationServiceEnabled = await location.requestService();

  }
return locationServiceEnabled;
  }

  Future<bool> _getLocationPermission() async {
    if (_isRequestingPermission) {
      while (_isRequestingPermission) {
        await Future.delayed(Duration(seconds: 200));

      }
      var status = await location.hasPermission();
      return status == PermissionStatus.granted;
    }

    _isRequestingPermission = true;

    try {
      var permissionStatus = await location.hasPermission();
      if (permissionStatus == PermissionStatus.denied) {

        permissionStatus = await location.requestPermission();


        }
      return permissionStatus == PermissionStatus.granted;
      }
    finally {
      _isRequestingPermission = false;
    }

    }



  }


