import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'extensions.dart';

ColorFilter getSvgColorFilter(Color color) =>
    ColorFilter.mode(color, BlendMode.srcIn);

double getFlexiblePageHeight(BuildContext context) {
  final screenSize = context.mediaQuery.size;
  const designSize = Constants.designSize;
  return max(screenSize.height, designSize.height);
}
