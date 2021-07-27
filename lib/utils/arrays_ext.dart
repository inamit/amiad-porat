import 'dart:math';

import 'package:flutter/material.dart';

extension RandomColor on List<Color> {
  Color random() {
    Random rnd = new Random();
    return this[rnd.nextInt(this.length)];
  }
}
