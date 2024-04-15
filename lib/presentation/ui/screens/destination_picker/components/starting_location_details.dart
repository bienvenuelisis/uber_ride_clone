import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uber_ride_clone/core/extensions/navigator.dart';
import 'package:uber_ride_clone/presentation/ui/screens/destination_picker/providers/location_place_provider.dart';

//// Show starting point details
class StartingLocationDetails extends StatefulWidget {
  ///Default Constructor
  const StartingLocationDetails({
    super.key,
  });

  @override
  State<StartingLocationDetails> createState() =>
      _StartingLocationDetailsState();
}

class _StartingLocationDetailsState extends State<StartingLocationDetails> {
  late Location _location;
  late bool _serviceEnabled;
  LocationData? _locationData;

  @override
  void initState() {
    _location = Location();
    _serviceEnabled = false;
    super.initState();
    // ignore: discarded_futures
    _loadLocation();
  }

  Future<void> _loadLocation() async {
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Location services are disabled',
            ),
          ),
        );
        context.pop();
      }
    }

    _locationData = await _location.getLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _locationData == null
        ? const Text(
            'Checking position...',
          )
        : Consumer(
            builder: (context, ref, child) {
              final locationInfo = Text(
                '${_locationData!.latitude}, ${_locationData!.longitude}',
              );

              final location = ref.watch(
                locationPlaceGeocodingProvider(
                  _locationData!,
                ),
              );

              if (location.isLoading || location.isReloading) {
                return Shimmer.fromColors(
                  baseColor: Colors.black45,
                  highlightColor: Colors.black,
                  child: locationInfo,
                );
              }

              return location.maybeMap(
                data: (data) {
                  if (data.value == null) {
                    return locationInfo;
                  }

                  return TextField(
                    controller: TextEditingController(
                      text: data.value!.formattedAddress,
                    ),
                    readOnly: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: 'Pickup',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  );
                },
                orElse: () => locationInfo,
              );
            },
          );
  }
}
