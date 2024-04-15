import 'package:flutter_riverpod/flutter_riverpod.dart';

///Provider that holds the actual destination place id.
// final destinationPlaceIdProvider = StateProvider.autoDispose<String?>(
final destinationPlaceIdProvider = StateProvider<String?>(
  (ref) => null,
);
