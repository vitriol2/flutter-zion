import 'package:flutter/material.dart';
import 'package:flutterbasicc/edit_image/provider/edit_image_provider.dart';
import 'package:flutterbasicc/scroll/multiple_scrollview_page.dart';
import 'package:flutterbasicc/scroll/nested_scroll_ex.dart';
import 'package:provider/provider.dart';
import 'bottom_navigation/bottom_navigation_page.dart';
import 'edit_image/edit_image_page.dart';
import 'edit_image/initial_page.dart';
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
      home: ChangeNotifierProvider<EditImageProvider>(
          create: (_) => EditImageProvider(),
          child: BottomNavigationMainPage()),
      debugShowCheckedModeBanner: false,
    );
  }
}
