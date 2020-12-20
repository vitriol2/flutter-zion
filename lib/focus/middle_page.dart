import 'package:flutter/material.dart';
import 'package:flutterbasicc/focus/textfield_page.dart';

class MiddlePage extends StatefulWidget {

  @override
  State createState() {
    return _MiddlePageState();
  }
}

class _MiddlePageState extends State<MiddlePage>{

  @override
  Widget build(BuildContext context) {

    print('middlepage build');
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TextFieldPage()
            ));
          },
          child: Container(
            color: Colors.black,
            width: 100,
            height: 70,
            child: Center(
              child: Text(
                'go to TextField',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}