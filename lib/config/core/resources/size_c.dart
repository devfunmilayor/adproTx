import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;

  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static double? textSizeMultiplier;
  static double? imageSizeMultiplier;

  static double? heightMultiplier;
  static double? widthMultiplier;

  void init(BoxConstraints constraints) {
    screenWidth = constraints.maxWidth;
    screenHeight = constraints.maxHeight;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    textSizeMultiplier = blockSizeHorizontal;
    imageSizeMultiplier = blockSizeHorizontal;
    heightMultiplier = blockSizeVertical;
    widthMultiplier = blockSizeHorizontal;
  }
}
