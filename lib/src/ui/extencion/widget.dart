import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'fade_in_animation.dart';

extension WidgetExtension on Widget {
  Widget fadeAnimation(double delay) {
    return FadeInAnimation(delay: delay, child: this);
  }

  printS(Object? object) {
    if (kDebugMode) {
      print(object);
    }
  }
}
