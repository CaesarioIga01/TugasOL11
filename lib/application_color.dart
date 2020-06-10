import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicationColor with ChangeNotifier{
  bool _isLightGreen = true;

  bool get isLightGreen => _isLightGreen;
  set isLightGreen(bool value)
  {
    _isLightGreen = value;
    notifyListeners();
  }

  Color get color => (_isLightGreen) ? Colors.lightGreen : Colors.lightBlueAccent;
}