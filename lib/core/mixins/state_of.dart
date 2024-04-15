import 'package:flutter/material.dart';

///State Of mixin
mixin StateOfMixin {
  ///Initialize the state
  Future<void> initialize([Future<dynamic> Function()? init]) async {
    if (init != null) {
      setState(() {
        state = StateOfEnum.initializing;
      });

      await init();

      setState(() {
        state = StateOfEnum.initial;
      });
    }
  }

  ///Actual state
  StateOfEnum state = StateOfEnum.initial;

  ///Set the state
  void setState(VoidCallback fn);

  ///Is initializing
  bool get initializing => state == StateOfEnum.initializing;

  ///Is processing
  bool get processing => state == StateOfEnum.processing;

  ///Is initial (before initializing and after successful initialization)
  bool get initial => state == StateOfEnum.initial;

  ///Is success
  bool get success => state == StateOfEnum.success;

  ///Is fail
  bool get fail => state == StateOfEnum.fail;

  set processing(bool value) {
    setState(() {
      if (value) {
        state = StateOfEnum.processing;
      } else {
        state = StateOfEnum.initial;
      }
    });
  }

  ///Set if is loading.
  set loading(bool value) {
    processing = value;
  }

  ///If is loading.
  bool get loading => processing;
}

///State of enum
enum StateOfEnum {
  ///Initializing
  initializing,

  ///Initial
  initial,

  ///Processing
  processing,

  ///Success
  success,

  ///Fail
  fail,
}
