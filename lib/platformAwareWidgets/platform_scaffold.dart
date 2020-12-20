import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterbasicc/platformAwareWidgets/platform_appbar.dart';
import 'package:flutterbasicc/platformAwareWidgets/platform_widget.dart';

class PlatformScaffold extends PlatformWidget {
  PlatformScaffold({
    this.appBar,
    this.body
});
  final PlatformAppBar appBar;
  final Widget body;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: appBar.buildCupertinoWidget(context),
      child: body,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return Scaffold(
      appBar: appBar.buildMaterialWidget(context),
      body: body
    );
  }


}