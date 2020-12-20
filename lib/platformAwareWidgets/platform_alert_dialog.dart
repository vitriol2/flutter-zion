import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbasicc/platformAwareWidgets/platform_widget.dart';

class PlatformAlertDialog extends PlatformWidget<CupertinoAlertDialog, AlertDialog> {
  PlatformAlertDialog({
    @required this.title,
    @required this.content,
    this.cancelText,
    @required this.confirmText
}) : assert(title!= null),
  assert(content != null),
  assert(confirmText != null);

  final String title;
  final String content;
  final String cancelText;
  final String confirmText;

  @override
  CupertinoAlertDialog buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _actions(
          context, cancelText, confirmText
      )
    );
  }

  @override
  AlertDialog buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
        actions: _actions(
          context, cancelText?.toUpperCase(), confirmText.toUpperCase()
        ),
    );
  }

  List<Widget> _actions(
      BuildContext context, String cancelText, String confirmText
      ) {
    print('confirmText: ' + confirmText);
    var actions = <Widget>[];
    if(cancelText != null) {
      actions.add(PlatformAlertDialogAction(
        child: Text(cancelText),
        onPressed: () => _dismiss(context, true)
      ));
    }
    actions.add(PlatformAlertDialogAction(
      child: Text(confirmText),
      onPressed: () => _dismiss(context, true),
    ));

    print('actions: ' + actions.toString());

    return actions;
  }

  Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool> (
      context: context,
      barrierDismissible: !Platform.isIOS,
      builder: (context) => this
    );

    return Future.value(result ?? false);
  }

  _dismiss(BuildContext context, bool value) {
    Navigator.of(context, rootNavigator: true).pop(value);
  }
}

class PlatformAlertDialogAction extends PlatformWidget{
  PlatformAlertDialogAction({
    this.child,
    this.onPressed
});
  final Widget child;
  final VoidCallback onPressed;

  @override
  CupertinoDialogAction buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
        onPressed: onPressed,
    );
  }

  @override
  FlatButton buildMaterialWidget(BuildContext context) {
    return FlatButton(
      child: child,
      onPressed: onPressed,
    );
  }


}