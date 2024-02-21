import 'package:flutter/material.dart';

class TableHelpers {
  static Alignment alignmentFromIndex(int index) {
    if (index == 0) return Alignment.centerLeft;

    return Alignment.center;
  }
}
