import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CubeProvider extends ChangeNotifier {
  CubeProvider();
  double _y = 90.0;
  double get y => _y;

  void rotateY(double value) {
    _y = value;

    notifyListeners();
  }
}
