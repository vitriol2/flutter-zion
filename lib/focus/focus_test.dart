import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterbasicc/focus/textfield_page.dart';

import 'middle_page.dart';

class FirstWidget extends StatefulWidget {

  @override
  State createState() {
    return _FirstWidgetState();
  }
}

class _FirstWidgetState extends State<FirstWidget>{


  @override
  Widget build(BuildContext context) {
    print('FirstWidtet build');
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MiddlePage()
            ));
          },
          child: Container(
            color: Colors.black,
            width: 100,
            height: 70,
            child: Center(
              child: Text(
                'go to middlePage',
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