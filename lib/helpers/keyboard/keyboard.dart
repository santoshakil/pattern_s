import 'package:flutter/widgets.dart';

class Keyboard {
  static void hide(BuildContext ctx) {
    FocusScopeNode currentFocus = FocusScope.of(ctx);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
