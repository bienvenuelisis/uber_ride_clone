import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:uber_ride_clone/core/config/google_place.dart';

///
final locationPlaceGeocodingProvider =
    FutureProvider.autoDispose.family<Result?, LocationData>((
  ref,
  query,
) async {
  final response = await http.get(
    Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=${query.latitude},${query.longitude}&key=$googleMapsApiKey',
    ),
  );

  if (response.statusCode != 200) {
    return null;
  }

  final location = geocodedPlaceFromJson(response.body);

  if (location.status == 'OK' && location.results.isNotEmpty) {
    return location.results.first;
  }

  return null;
});

///Geocoded Place from json
GeocodedPlace geocodedPlaceFromJson(String str) =>
    GeocodedPlace.fromJson(json.decode(str) as Map<String, dynamic>);

///Geocoded Place to json
String geocodedPlaceToJson(GeocodedPlace data) => json.encode(data.toJson());

///Starting Place found using Geocoding
class GeocodedPlace {
  ///Default Constructor
  GeocodedPlace({
    required this.plusCode,
    required this.results,
    required this.status,
  });

  ///Factory from json converter
  factory GeocodedPlace.fromJson(Map<String, dynamic> json) => GeocodedPlace(
        plusCode: PlusCode.fromJson(json['plus_code'] as Map<String, dynamic>),
        results: List<Result>.from(
          (json['results'] as List<dynamic>).map(
            (result) => Result.fromJson(result as Map<String, dynamic>),
          ),
        ).toList(),
        status: json['status'] as String,
      );

  ///Plus Code
  final PlusCode plusCode;

  ///Results
  final List<Result> results;

  ///Status
  final String status;

  ///Copy with
  GeocodedPlace copyWith({
    PlusCode? plusCode,
    List<Result>? results,
    String? status,
  }) =>
      GeocodedPlace(
        plusCode: plusCode ?? this.plusCode,
        results: results ?? this.results,
        status: status ?? this.status,
      );

  ///To json
  Map<String, dynamic> toJson() => {
        'plus_code': plusCode.toJson(),
        'results': List<dynamic>.from(results.map((x) => x.toJson())),
        'status': status,
      };
}

///Plus Code
class PlusCode {
  ///Default Constructor
  PlusCode({
    required this.compoundCode,
    required this.globalCode,
  });

  ///Factory from json converter
  factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
        compoundCode: json['compound_code'] as String,
        globalCode: json['global_code'] as String,
      );

  ///Compound Code
  final String compoundCode;

  ///Global Code
  final String globalCode;

  ///Copy with
  PlusCode copyWith({
    String? compoundCode,
    String? globalCode,
  }) =>
      PlusCode(
        compoundCode: compoundCode ?? this.compoundCode,
        globalCode: globalCode ?? this.globalCode,
      );

  ///To json
  Map<String, dynamic> toJson() => {
        'compound_code': compoundCode,
        'global_code': globalCode,
      };
}

///Result
class Result {
  ///Default Constructor
  Result({
    required this.addressComponents,
    required this.formattedAddress,
    required this.placeId,
    required this.types,
    this.plusCode,
  });

  ///Factory from json converter
  factory Result.fromJson(Map<String, dynamic> json) => Result(
        addressComponents: List<AddressComponent>.from(
          (json['address_components'] as List<dynamic>).map(
            (ac) => AddressComponent.fromJson(ac as Map<String, dynamic>),
          ),
        ),
        formattedAddress: json['formatted_address'] as String,
        placeId: json['place_id'] as String,
        types: List<String>.from(json['types'] as List<dynamic>),
        plusCode: json['plus_code'] == null
            ? null
            : PlusCode.fromJson(json['plus_code'] as Map<String, dynamic>),
      );

  ///Address Components
  final List<AddressComponent> addressComponents;

  ///Formatted Address
  final String formattedAddress;

  ///Place Id
  final String placeId;

  ///Types
  final List<String> types;

  ///Plus Code
  final PlusCode? plusCode;

  ///Copy with
  Result copyWith({
    List<AddressComponent>? addressComponents,
    String? formattedAddress,
    String? placeId,
    List<String>? types,
    PlusCode? plusCode,
  }) =>
      Result(
        addressComponents: addressComponents ?? this.addressComponents,
        formattedAddress: formattedAddress ?? this.formattedAddress,
        placeId: placeId ?? this.placeId,
        types: types ?? this.types,
        plusCode: plusCode ?? this.plusCode,
      );

  ///To json
  Map<String, dynamic> toJson() => {
        'address_components':
            List<dynamic>.from(addressComponents.map((x) => x.toJson())),
        'formatted_address': formattedAddress,
        'place_id': placeId,
        'types': List<dynamic>.from(types.map((x) => x)),
        'plus_code': plusCode?.toJson(),
      };
}

///Address Component
class AddressComponent {
  ///Default Constructor
  AddressComponent({
    required this.longName,
    required this.shortName,
  });

  ///Factory from json converter
  factory AddressComponent.fromJson(Map<String, dynamic> json) =>
      AddressComponent(
        longName: json['long_name'] as String,
        shortName: json['short_name'] as String,
      );

  ///Long Name
  final String longName;

  ///Short Name
  final String shortName;

  ///Copy with
  AddressComponent copyWith({
    String? longName,
    String? shortName,
  }) =>
      AddressComponent(
        longName: longName ?? this.longName,
        shortName: shortName ?? this.shortName,
      );

  ///To json
  Map<String, dynamic> toJson() => {
        'long_name': longName,
        'short_name': shortName,
      };
}
