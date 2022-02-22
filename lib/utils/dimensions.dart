import 'package:get/get.dart';

class Dimension {
  static double screenHeight = Get.context!.height; // 683.4
  static double screenWidth = Get.context!.width; // 411.4

  static double pageView = screenHeight / 2.1;
  static double pageViewContainer = screenHeight / 3.1;
  static double pageViewTextContainer = screenHeight / 5.70;

// dynamic height, padding and margin
  static double height10 = screenHeight / 68.34;
  static double height15 = screenHeight / 45.56;
  static double height20 = screenHeight / 34.17;
  static double height25 = screenHeight / 27.3;
  static double height45 = screenHeight / 15.2;
  static double height30 = screenHeight / 22.78;

  // dynamic width, padding and margin
  static double width10 = screenHeight / 68.34;
  static double width15 = screenHeight / 45.56;
  static double width20 = screenHeight / 34.17;
  static double width30 = screenHeight / 22.78;
  static double width45 = screenHeight / 15.2;

  static double font20 = screenHeight / 34.17;

  static double radius15 = screenHeight / 45.56;
  static double radius20 = screenHeight / 34.17;
  static double raduis30 = screenHeight / 22.78;
}