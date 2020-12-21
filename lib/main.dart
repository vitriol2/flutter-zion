import 'package:flutter/material.dart';
import 'edit_image/edit_image_page.dart';
import 'image_pick/image_pick_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImagePickPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}