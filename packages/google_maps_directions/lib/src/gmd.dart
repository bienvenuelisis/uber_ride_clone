import 'exceptions/exception.dart';

class GoogleMapsDirections {
  static String? _googleAPIKey;

  static String get googleApiKey {
    if (_googleAPIKey == null) {
      throw DirectionsException(
        status: "invalid-api-key",
        message: "Invalid api key or not set",
      );
    }
    return _googleAPIKey!;
  }

  /// Initialize plugin.
  /// [googleAPIKey] : Valid Google Maps Routes API Key.
  static void init({
    required String googleAPIKey,
  }) {
    _googleAPIKey = googleAPIKey;
  }
}
