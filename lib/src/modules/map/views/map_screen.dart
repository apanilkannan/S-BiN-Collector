import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:s_bin_collector/src/modules/map/controllers/map_controller.dart';

class MapScreen extends GetView<MapController> {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Obx(
            () => GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: false,
                compassEnabled: false,
                myLocationEnabled: false,
                markers: controller.allMarkers.toSet(),
                onMapCreated: (GoogleMapController gMap) {
                  controller.gmController.complete(gMap);
                  gMap.animateCamera(CameraUpdate.newLatLngBounds(controller.boundsFromLatLngList(controller.positions), 50));
                },
                initialCameraPosition: controller.kGooglePlex),
          ),
        ],
      ),
    ));
  }
}
