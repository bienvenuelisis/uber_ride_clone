import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_place/google_place.dart';
import 'package:uber_ride_clone/core/config/google_place.dart';

/// Service that helps get place details from a place id.
final getPlaceDetailsFromId =
    FutureProvider.autoDispose.family<DetailsResponse?, String>((
  ref,
  query,
) async {
  final response = await googlePlace.details.get(
    query,
  );

  return response;
});
