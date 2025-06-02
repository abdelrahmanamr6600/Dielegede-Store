import 'package:dielegende_store/features/store/presentation/cubit/StoreCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';

class LocationHelper {
  static Future<String?> getCurrentAddress() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        final place = placemarks.first;
        return "${place.locality}, ${place.administrativeArea}";
      } catch (e) {
        print("Error getting location: $e");
        return null;
      }
    } else {
      return null;
    }
  }
}

void goToNearbyStores(BuildContext context) async {
  try {
    Position position = await Geolocator.getCurrentPosition();

    final storeProductsCubit = context.read<StoreProductsCubit>();
    final allStores = storeProductsCubit.allStores;
    if (allStores == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("there are no stores available")),
      );
      return;
    }
    final storesList = allStores.data.stores;

    final nearbyStores = storesList.where((store) {
      double distanceInMeters = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        store.latitude,
        store.longitude,
      );
      return distanceInMeters < 5000;
    }).toList();

    context.pushNamed(
      'nearbyStores',
      extra: {
        'userLat': position.latitude,
        'userLng': position.longitude,
        'stores': nearbyStores,
      },
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content:
              Text("An error occurred while determining the location: $e")),
    );
  }
}
