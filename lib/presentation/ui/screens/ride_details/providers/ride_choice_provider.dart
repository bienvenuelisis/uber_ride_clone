import 'package:flutter_riverpod/flutter_riverpod.dart';

///Provider that holds the selected ride plan key value.
final ridePlanSelectedProvider = StateProvider.autoDispose<String?>(
  (ref) => null,
);
