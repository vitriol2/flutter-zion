import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainFourthPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Fourth Page')
      ),
      body: Container(
        color: Color.fromRGBO(152, 196, 255, 1.0),
        child: Center(
          child: Container(
            width: 135,
            height: 70,
            child: RawMaterialButton(
              onPressed: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => DetailFourthPage()));
              },
              fillColor: Color.fromRGBO(51, 137, 255, 1),
              child: Text(
                'go to \n detail page',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailFourthPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Fourth Page')
      ),
      body: Container(
        color: Color.fromRGBO(51, 137, 255, 1),
      ),
    );
  }
}