import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbasicc/app/switch_page.dart';
import 'package:flutterbasicc/platformAwareWidgets/platform_alert_dialog.dart';
import 'package:flutterbasicc/platformAwareWidgets/platform_appbar.dart';
import 'package:flutterbasicc/platformAwareWidgets/platform_button.dart';
import 'package:flutterbasicc/platformAwareWidgets/platform_scaffold.dart';

class DialogPage extends StatefulWidget {

  @override
  State createState() {
    return _DialogPageState();
  }
}

class _DialogPageState extends State<DialogPage>{

  void _showHelpDialog(BuildContext context) async {
    PlatformAlertDialog(
      title: 'Platform aware widgets',
        content: 'Operationg System: ' + Platform.operatingSystem,
        confirmText: 'Dismiss',
    ).show(context);
  }

  void _showTwoButtonsDialog(BuildContext context) async {
    final didLogout = await PlatformAlertDialog(
      title: 'Logout',
        content: 'Are you sure that you wnt to logout?',
        cancelText: 'Cancel',
        confirmText: 'Logout',
    ).show(context);
  }

  void _showOneButtonDialog(BuildContext context) async {
    final didConfirm = await PlatformAlertDialog(
      title: 'Network error',
      content: 'Please try again later',
      confirmText: 'OK',
    ).show(context);
    _showSnackBarWithText(context, 'did confirm: $didConfirm');
  }

  void _showSnackBarWithText(BuildContext context, String text) {
    if(Platform.isIOS) {
      print('[Snackbar not supported] $text');
    } else {
      final scaffold = Scaffold.of(context);
      scaffold.hideCurrentSnackBar();
      scaffold.showSnackBar(SnackBar(content: Text(text),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Platform aware AppBar'),
          actions: [
            PlatformButton(
              child: Text(
                'About',
                style: TextStyle(
                  color: Platform.isIOS ? Colors.blue : Colors.white,
                  fontSize: 18
                ),
              ),
              onPressed: () => _showHelpDialog(context),
            )
          ],
      ),
      body: buildContents(context),
    );
  }

  Widget buildContents(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlatformButton(
              child: Text('Dialog with two buttons',
              style: TextStyle(color: Colors.white),),
              color: Colors.blue,
                onPressed: () => _showTwoButtonsDialog(context),
            ),
            SizedBox(height: 16),
            PlatformButton(
              child: Text('Dialog with one button',
              style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () => _showOneButtonDialog(context)
            ),
            SizedBox(height: 16,),
            PlatformButton(
                child: Text('Navigator',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SwitchesPage()
                  ));
                }
            ),
          ],
        ),
      ),
    );
  }


}