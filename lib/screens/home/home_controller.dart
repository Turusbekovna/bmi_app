import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../conctans/colors/app_colors.dart';

class HomeController extends GetxController {
  Rx<Color> maleColor = AppColors.purpleDark.obs;
  Rx<Color> femaleColor = AppColors.purpleDark.obs;
  Rx<double> heightValue = 70.0.obs;
  Rx<int> weight = 60.obs;
  Rx<int> age = 20.obs;

  void male() {
    maleColor.value = AppColors.activeColor;
    femaleColor.value = AppColors.purpleDark;
  }

  void female() {
    femaleColor.value = AppColors.activeColor;
    maleColor.value = AppColors.purpleDark;
  }

  void minusweight() {
    weight.value--;
  }

  void plusweight() {
    weight.value++;
  }

  void minusAge() {
    age.value--;
  }

  void plusAge() {
    age.value++;
  }
}
