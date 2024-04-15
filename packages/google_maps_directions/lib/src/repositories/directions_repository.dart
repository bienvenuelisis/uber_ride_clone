import 'dart:convert';

import 'package:google_maps_directions/src/exceptions/exception.dart';
import 'package:http/http.dart' as http;

import '../models/address_point.dart';
import '../models/directions.dart';

class DirectionsRepository {
  Future<Directions> get({
    required AddressPoint origin,
    required AddressPoint destination,
    required String googleAPIKey,
    String? language,
    String? mode, //driving, walking, bicycling, transit
    String? transitMode, //bus, subway, train, tram, rail
  }) async {
    final response = await http.get(
      Uri.https(
        "maps.googleapis.com",
        "/maps/api/directions/json",
        {
          'origin': '${origin.lat},${origin.lng}',
          'destination': '${destination.lat},${destination.lng}',
          'key': googleAPIKey,
          'alternatives': true.toString(),
          'language': language,
          'mode': mode,
        },
      ),
    );

    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      if (json["status"] == "OK") {
        if ((json["routes"] as List).isEmpty) {
          throw DirectionsException(
            status: json["status"],
            message: json["error_message"],
            description: "No routes between this two points.",
          );
        } else {
          return Directions.fromJson(json);
        }
      } else {
        throw DirectionsException(
          status: json["status"],
          message: json["error_message"],
        );
      }
    } else {
      throw DirectionsException(
        status: response.statusCode.toString(),
        message: response.body,
      );
    }
  }
}
