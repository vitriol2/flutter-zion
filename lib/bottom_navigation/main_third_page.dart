import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainThirdPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Third Page')
      ),
      body: Container(
        color: Color.fromRGBO(142, 255, 147, 1.0),
        child: Center(
          child: Container(
            width: 135,
            height: 70,
            child: RawMaterialButton(
              onPressed: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => DetailThirdPage()));
              },
              fillColor: Color.fromRGBO(0, 200, 9, 1),
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

class DetailThirdPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Third Page',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),

        ),
      ),
      body: Container(
        color: Color.fromRGBO(0, 200, 9, 1),
      ),
    );
  }
}