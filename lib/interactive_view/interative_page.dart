import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterbasicc/interactive_view/provider/interactiver_provider.dart';
import 'package:provider/provider.dart';

import 'interactive_viewer_overlay.dart';

class InteractivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    bool isScaling =
        Provider.of<InteractiveViewerProvider>(context).getIsScaling() ?? false;
    return Scaffold(
        appBar: AppBar(),
        body:  ListView(children: [
          Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                      Border(bottom: BorderSide(color: Colors.green))),
                  width: double.infinity,
                  height: 60,
                  child: Column(children: [
                    Text('Abdelazeem Kuratem',
                        style: TextStyle(color: Colors.black)),
                    Text('5 min', style: TextStyle(color: Colors.black)),
                  ])),
              InteractiveViewerOverlay(
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/6/6a/Mona_Lisa.jpg",
                  width: _width,
                  height: _width,
                  fit: BoxFit.cover,
                ),
                context: context,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    border: Border(top: BorderSide(color: Colors.green))),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _createBottomButton(
                            text: 'Like',
                            icon: Icons.thumb_up,
                            onPressed: () {}),
                        _createBottomButton(
                            text: 'Comment',
                            icon: Icons.comment,
                            onPressed: () {}),
                        _createBottomButton(
                            text: 'Share',
                            icon: Icons.share,
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),);
  }

  Widget _createBottomButton({
    String text,
    IconData icon,
    Null Function() onPressed,
  }) {
    return FlatButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.green,
        size: 21,
      ),
      label: Text(
        text,
        style: TextStyle(color: Colors.green, fontSize: 14),
      ),
    );
  }
}
