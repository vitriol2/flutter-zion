import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbasicc/interactive_view/interative_page.dart';
import 'package:flutterbasicc/interactive_view/provider/interactiver_provider.dart';
import 'package:provider/provider.dart';

class Bridge extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Container(
            width: 100,
            height: 100,
              color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeNotifierProvider<InteractiveViewerProvider>(
              create: (context) => InteractiveViewerProvider(),
              child: InteractivePage()),
            ));
          },
        ),
      )
    );
  }
}