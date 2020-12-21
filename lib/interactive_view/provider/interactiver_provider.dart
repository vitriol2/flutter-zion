import 'package:flutter/foundation.dart';

class InteractiveViewerProvider with ChangeNotifier {
  bool _isScaling;

  bool getIsScaling() => _isScaling;

  void setIsScaling(bool isScaling) {
    _isScaling = isScaling;

    notifyListeners();
  }
}