import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uber_ride_clone/core/extensions/build_context.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/providers/geolocation.dart';

/// User current Location Widget
class CurrentLocation extends StatelessWidget {
  /// Default constructor
  const CurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your current location',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: AppSizes.h_12,
        ),
        Consumer(
          builder: (_, ref, __) {
            return FutureBuilder<LocationData>(
              // ignore: discarded_futures
              future: ref.read(locationProvider).getLocation(),
              builder: (___, snapshot) {
                if (snapshot.hasData) {
                  final location = snapshot.data!;

                  return SizedBox(
                    width: context.width * 0.9,
                    height: context.height * 0.3,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: GoogleMap(
                        myLocationEnabled: true,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                            location.latitude!,
                            location.longitude!,
                          ),
                          zoom: 15,
                        ),
                      ),
                    ),
                  );
                }

                return Shimmer.fromColors(
                  baseColor: Colors.black45,
                  highlightColor: Colors.black,
                  child: SizedBox(
                    width: context.width * 0.9,
                    height: context.height * 0.3,
                    child: const GoogleMap(
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          0,
                          0,
                        ),
                        zoom: 1,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        const SizedBox(
          height: AppSizes.h_12,
        ),
      ],
    );
  }
}
