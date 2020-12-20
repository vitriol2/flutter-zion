import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CountriesField.dart';

class OverlayEntryTest extends StatefulWidget {

  @override
  State createState() {
    return _OverlayEntryTestState();
  }
}

class _OverlayEntryTestState extends State<OverlayEntryTest>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              CountriesField(),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Address'
                ),
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'City'
                ),
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Address'
                ),
              ),
              SizedBox(height: 16.0,),
              RaisedButton(
                child: Text('SUBMIT'),
                onPressed: () {
                  // submit the form
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}