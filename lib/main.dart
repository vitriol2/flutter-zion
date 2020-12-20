import 'package:flutter/material.dart';

import 'app/bottom_navigation.dart';
import 'edit_image/edit_image_page.dart';
import 'edit_image/extended_image_slide_page.dart';
import 'edit_image/image_page.dart';
import 'focus/focus_test.dart';
import 'image_pick/image_pick_page.dart';
import 'interactive_view/interative_page.dart';
import 'interactive_view/overlay/overlay_entry_test.dart';
import 'navigator/navigator_back_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OverlayEntryTest(),
      debugShowCheckedModeBanner: false,
    );
  }
}