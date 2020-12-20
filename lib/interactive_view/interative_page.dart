import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'interactive_viewer_overlay.dart';

class InteractivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(children: [
          Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(bottom: BorderSide(color: Colors.green))),
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
                  fit: BoxFit.contain,
                ),
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
                            text: 'Share', icon: Icons.share, onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]));
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
