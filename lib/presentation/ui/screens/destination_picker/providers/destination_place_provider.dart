import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_place/google_place.dart';
import 'package:uber_ride_clone/core/config/google_place.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';

///
final destinationPlacesSearchProvider = FutureProvider.autoDispose
    .family<List<DestinationPlacePrediction>?, String>((
  ref,
  query,
) async {
  final response = await googlePlace.autocomplete.get(
    query,
    language: 'fr',
    region: 'tg',
    components: [Component('country', 'tg')],
    types: 'establishment',
  );

  return (response?.predictions ?? [])
      .map(DestinationPlacePrediction.fromGoogleMapsApi)
      .toList();
});

///Destination Place Prediction Model
class DestinationPlacePrediction {
  ///
  DestinationPlacePrediction({
    required this.placeId,
    required this.title,
    required this.description,
    required this.establishmentIcon,
  });

  /// Helper factory method from Google Maps API
  factory DestinationPlacePrediction.fromGoogleMapsApi(
    AutocompletePrediction prediction,
  ) {
    final place = prediction.terms == null || prediction.terms!.isEmpty
        ? prediction.description ?? ''
        : prediction.terms!.first.value ?? '';

    final location = prediction.terms == null || prediction.terms!.length < 2
        ? prediction.reference ?? ''
        : prediction.terms!
            .getRange(1, prediction.terms!.length - 1)
            .map((term) => term.value)
            .join(', ');

    final establishmentIconDefault = SvgPicture.asset(
      'assets/images/maps_icons/icons/map-pin.svg',
      semanticsLabel: place,
      height: AppSizes.h_16,
    );

    final establishmentTypeIcon =
        prediction.types == null || prediction.types!.isEmpty
            ? establishmentIconDefault
            : SvgPicture.asset(
                'assets/images/maps_icons/icons/${prediction.types!.first.replaceAll('_', '-')}.svg',
                semanticsLabel: prediction.types!.first,
                height: AppSizes.h_16,
                placeholderBuilder: (_) => establishmentIconDefault,
              );

    return DestinationPlacePrediction(
      placeId: prediction.placeId!,
      title: place,
      description: location,
      establishmentIcon: establishmentTypeIcon,
    );
  }

  ///Place Id
  final String placeId;

  ///Place Title
  final String title;

  ///Place Description
  final String description;

  ///Establishment Icon
  final Widget establishmentIcon;
}
