import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbasicc/platformAwareWidgets/platform_widget.dart';

class PlatformAppBar extends PlatformWidget {
  PlatformAppBar({this.leading, this.title, this.actions});
  final Widget leading;
  final Widget title;
  final List<Widget> actions;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoNavigationBar(
      leading: leading,
      middle: title,
      trailing: Row(
        children: actions,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title,
      actions: actions,
    );
  }
}