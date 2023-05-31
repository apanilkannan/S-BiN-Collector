import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:s_bin_collector/src/common/prefernce_utils.dart';
import 'package:s_bin_collector/src/routes/app_routes.dart';

class MapController extends GetxController {
  // FOR GETTING THE CURRENT LATITUDE AND LONGITUDE OF USER
  Position? currentPosition;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  final Completer<GoogleMapController> gmController =
      Completer<GoogleMapController>();

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(8.5584667, 76.8605138),
    zoom: 16,
  );

  // on below line we have created list of markers
  List<Marker> allMarkers = <Marker>[].obs;

  List<LatLng> positions = [
    const LatLng(8.5584667, 76.8605138),
    const LatLng(8.56, 76.87),
    const LatLng(8.54, 76.88),

  ];

  final List<Marker> list = [
    // List of Markers Added on Google Map
    Marker(
        onTap: () {
          var data = {"device": "Bin 1", "location": "Marian Engineering College",'Latitude':8.5584667,'Longitude': 76.8605138,'marker' : 01};
          Get.toNamed(AppRoutes.markerDetail, arguments: data);
          //MapsLauncher.launchCoordinates(8.5584667, 76.8605138);
        },
        markerId: const MarkerId('1'),
        position: const LatLng(8.5584667, 76.8605138),
        infoWindow: const InfoWindow(
          title: 'Marian Engineering College',
        )),

    Marker(
        onTap: () {
          var data = {"device": "Bin 2", "location": "Al-Madeena Flour Mill",'Latitude':8.56,'Longitude': 76.87,'marker' : 02};
          Get.toNamed(AppRoutes.markerDetail, arguments: data);
        },
        markerId: const MarkerId('2'),
        position: const LatLng(8.56, 76.87),
        infoWindow: const InfoWindow(
          title: 'Al-Madeena Flour Mill',
        )),

    Marker(
        onTap: () {
          var data = {"device": "Bin 3", "location": "Atul finance",'Latitude':8.54,'Longitude': 76.88,'marker' : 02};
          Get.toNamed(AppRoutes.markerDetail, arguments: data);
        },
        markerId: const MarkerId('3'),
        position: const LatLng(8.54, 76.88),
        infoWindow: const InfoWindow(
          title: 'Atul Finance',
        )),
  ];

  final ref = FirebaseDatabase.instance.ref();


  @override
  void onInit() {
    allMarkers.addAll(list);
    handleLocationPermission();

    getToken();
    super.onInit();
  }

  /// REQUESTING THE LOCATION PERMISSION FROM USER
  Future<void> handleLocationPermission() async {
    final status = await Permission.locationWhenInUse.request();

    debugPrint("status 20 : $status");
    if (status == PermissionStatus.granted) {
      _getCurrentPosition();

      debugPrint('Permission Granted : $status');
    } else if (status == PermissionStatus.denied) {
      debugPrint('Permission denied : $status');
    } else if (status == PermissionStatus.permanentlyDenied) {
      debugPrint('Permission Permanently Denied : $status');
      await openAppSettings();
    }
    update();
  }

  // TO GET THE CURRENT POSITION OF THE USER
  Future<void> _getCurrentPosition() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      debugPrint(
          'currentPosition : ${currentPosition?.latitude} , ${currentPosition?.longitude}');
      latitude.value = currentPosition!.latitude;
      longitude.value = currentPosition!.longitude;
      debugPrint('latitude : ${latitude.value}');
      debugPrint('longitude : ${longitude.value}');
    }).catchError((e) {
      debugPrint(e);
    });
  }

  getToken() async {
    var token = PreferenceUtils.getString('token');
    debugPrint('token : $token');
  }

  LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    assert(list.isNotEmpty);
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > (x1 ?? 0)) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > (y1 ?? 0)) y1 = latLng.longitude;
        if (latLng.longitude < (y0 ?? double.infinity)) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
      northeast: LatLng(x1 ?? 0, y1 ?? 0),
      southwest: LatLng(x0 ?? 0, y0 ?? 0),
    );
  }



}
