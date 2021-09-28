import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, Widget;

import '../helpers/size_config/size_config.dart' show ScreenSize;
import 'screen1/screen1.dart' show Screen1;

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Screen1();
  }
}
