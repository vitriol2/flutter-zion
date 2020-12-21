import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:photo_manager/photo_manager.dart';

class Photo {
  Widget widget;
  AssetEntity asset;
  bool isSelected;

  Photo({this.widget, this.asset, this.isSelected = false});
}
