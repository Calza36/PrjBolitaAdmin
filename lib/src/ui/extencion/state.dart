import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

extension WidgetExtension on State {
  popFrom(BuildContext context) {
    Navigator.pop(context);
  }

  // pops2(BuildContext context) {
  //   Navigator.pop(context);
  //   Navigator.pop(context);
  // }

  printS(Object? object) {
    if (kDebugMode) {
      print(object);
    }
  }
}
