import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbasicc/platformAwareWidgets/platform_widget.dart';

class PlatformSwitch extends PlatformWidget<CupertinoSwitch, Switch> {
  PlatformSwitch({
    Key key, this.value, this.onChanged
}) : super(key: key);
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  CupertinoSwitch buildCupertinoWidget(BuildContext context) {
    return CupertinoSwitch(value: value, onChanged: onChanged);
  }

  @override
  Switch buildMaterialWidget(BuildContext context) {
    return Switch(value: value, onChanged: onChanged);
  }


}