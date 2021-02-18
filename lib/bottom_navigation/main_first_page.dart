import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainFirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Main First Page')
      ),
      body: Container(
          color: Colors.white,
        child: Center(
          child: Container(
            width: 135,
            height: 70,
            child: RawMaterialButton(
              onPressed: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => DetailFirstPage()));
              },
              fillColor: Color.fromRGBO(211, 211, 211, 1),
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

class DetailFirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Detail First Page')
      ),
      body: Container(
        color: Color.fromRGBO(211, 211, 211, 1),
      ),
    );
  }
}