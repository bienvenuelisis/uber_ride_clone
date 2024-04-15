import 'package:flutter/foundation.dart';

///Error props
abstract class ErrorProps {
  String? _error = '';

  ///Set the error message.
  // ignore: avoid_annotating_with_dynamic
  set error(dynamic error) {
    setState(() {
      if (error is bool) {
        if (error) {
          _error = "Une erreur s'est produite.";
        } else {
          _error = '';
        }
      } else {
        _error = error.toString();
      }
    });
  }

  ///If there is an error.
  bool get error => errorMessage.isNotEmpty;

  ///Get the error message.
  String get errorMessage => _error ?? '';

  ///Set the state.
  void setState(VoidCallback fn);
}
