import 'package:flutter_riverpod/flutter_riverpod.dart';

///Provider that holds the query fro, the destination location search textfield.
final destinationLocationSearchProvider = StateProvider.autoDispose<String?>(
  (ref) => null,
);
