import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterbasicc/platformAwareWidgets/platform_widget.dart';

class PlatformButton extends PlatformWidget {
  PlatformButton({
    Key key,
    this.child,
    this.color,
    this.onPressed
}) : super(key: key);
  final Widget child;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoButton(
      child: child,
      color: color,
      pressedOpacity: 0.5,
      onPressed: onPressed,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return FlatButton(
      child: child,
      color: color,
        onPressed: onPressed,
    );
  }


}