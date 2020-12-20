import 'dart:io';

import 'package:flutter/widgets.dart';

abstract class PlatformWidget<C extends Widget, M extends Widget>
  extends StatelessWidget {

  PlatformWidget({Key key}) : super(key: key);

  C buildCupertinoWidget(BuildContext context);
  M buildMaterialWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) {
      return buildCupertinoWidget(context);
    }
    
    return buildMaterialWidget(context);
  }


}