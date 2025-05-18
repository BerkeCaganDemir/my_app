import 'package:flutter/material.dart';

class WaveformController extends ChangeNotifier {
  double _progress = 0;

  double get progress => _progress;

  void updateProgress(double newValue) {
    _progress = newValue;
    notifyListeners();
  }

  void reset() {
    _progress = 0;
    notifyListeners();
  }
}
