import 'package:flutter/widgets.dart'
    show BuildContext, FocusScope, FocusScopeNode;

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}
