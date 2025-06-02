import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoreLocationScreen extends StatelessWidget {
  const StoreLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = GoRouterState.of(context).extra as Map<String, dynamic>;
    if (args == null) {
      return const Center(child: Text("No location data provided"));
    }
    final double lat = args['lat'];
    final double lng = args['lon'];
    final String storeName = args['storeName'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: storeName),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, lng),
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("store_location"),
            position: LatLng(lat, lng),
            infoWindow: InfoWindow(title: storeName),
          ),
        },
      ),
    );
  }
}
