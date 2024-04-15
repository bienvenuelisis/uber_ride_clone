import 'package:flutter/foundation.dart';

///Props
mixin PropsMixin {
  bool _loading = false;

  ///If is loading.
  bool get loading => _loading;

  set loading(bool value) {
    setState(() {
      _loading = value;
    });
  }

  ///Set the state.
  void setState(VoidCallback fn);
}
