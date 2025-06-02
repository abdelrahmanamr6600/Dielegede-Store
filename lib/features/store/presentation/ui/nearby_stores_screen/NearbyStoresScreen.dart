import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/features/store/data/model/AllStoresModel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyStoresMapScreen extends StatelessWidget {
  final double userLat;
  final double userLng;
  final List<AllStoreProductsModel> nearbyStores;

  const NearbyStoresMapScreen({
    super.key,
    required this.userLat,
    required this.userLng,
    required this.nearbyStores,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "nearby stores"),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(userLat, userLng),
          zoom: 14,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("me"),
            position: LatLng(userLat, userLng),
            infoWindow: const InfoWindow(title: "Your Location"),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          ),
          ...nearbyStores.map((store) {
            return Marker(
              markerId: MarkerId(store.id.toString()),
              position: LatLng(store.latitude, store.longitude),
              infoWindow: InfoWindow(title: store.name),
            );
          }).toSet(),
        },
      ),
    );
  }
}
