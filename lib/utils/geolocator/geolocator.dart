import 'package:app_socios/utils/flushBarGlobal.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class GeolocatorConfig {
  Future<bool> geolocatorEnable() async {
    final res = await Geolocator.isLocationServiceEnabled();

    if (res) {
      return true;
    } else {
      return false;
    }
  }

  Future<LocationPermission?> requestPermission(context) async {
    if (await geolocatorEnable()) {
      var permission = await Geolocator.checkPermission();

      switch (permission) {
        case LocationPermission.denied:
          scaffoldMessenger(
              context, "Permiso denegado", const Icon(Icons.warning));
          await Geolocator.requestPermission();
          break;
        case LocationPermission.deniedForever:
         scaffoldMessenger(
              context,
              "El permiso ha sido denegado, diríjase a la configuración de su dispositivo y actívela manualmente",
              const Icon(Icons.warning));
          break;
        default:
      }

      return await Geolocator.checkPermission();
    } else {
     scaffoldMessenger(
          context, "La ubicación está desacitvada", const Icon(Icons.error));
    }
    return null;
  }
}