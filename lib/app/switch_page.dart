import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchesPage extends StatefulWidget {

  @override
  State createState() {
    return _SwitchesPageState();
  }
}

class _SwitchesPageState extends State<SwitchesPage>{
  bool _switchValue = false;

  void _platformSwitchChanged(BuildContext context, bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material AppBar'),
        actions: [
          FlatButton(
            child: Text(
              'About',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0
              ),
            ),
//            onPressed: () => _showHelpDialog(context)
          )
        ],
        elevation: Platform.isIOS ? 0.0 : 4.0
      ),
      body: buildContents(),
    );
  }

  Widget buildContents() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Active', style: TextStyle(fontSize: 20.0)),
                Switch.adaptive(
                  value: _switchValue,
                  onChanged: (value) => _platformSwitchChanged(context, value),
                ),
              ],
            ),
            SizedBox(height: 60.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Inactive', style: TextStyle(fontSize: 20.0)),
                Switch.adaptive(
                  value: true,
                  onChanged: null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}