import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {

  @override
  State createState() {
    return _TextFieldPageState();
  }
}

class _TextFieldPageState extends State<TextFieldPage>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('TextFieldPage initState()');
  }


  @override
  Widget build(BuildContext context) {
//    double _width = MediaQuery
  print('TextFieldPage build');
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.blue,
          child: Center(
            child: Container(
              color: Colors.white,
              width: 200,
              child: TextField(

              ),
            )
          ),
        ),
      ),
    );
  }
}