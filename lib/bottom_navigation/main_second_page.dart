import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainSecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Second Page')
      ),
      body: Container(
        color: Color.fromRGBO(255, 183, 183, 1.0),
        child: Center(
          child: Container(
            width: 135,
            height: 70,
            child: RawMaterialButton(
              onPressed: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => DetailSecondPage()));
              },
              fillColor: Color.fromRGBO(153, 67, 67, 1),
              child: Text(
                'go to \n detail page',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white
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

class DetailSecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Second Page')
      ),
      body: Container(
        color: Color.fromRGBO(153, 67, 67, 1),
        child: Center(
          child: Container(
            width: 135,
            height: 70,
            child: RawMaterialButton(
              onPressed: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => DetailDetailSecondPage()));
              },
              fillColor: Color.fromRGBO(90, 41, 43, 1),
              child: Text(
                'go to \n detaildetail page',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white
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


class DetailDetailSecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('DetailDetail Second Page')
      ),
      body: Container(
        color: Color.fromRGBO(90, 41, 43, 1),
      ),
    );
  }
}