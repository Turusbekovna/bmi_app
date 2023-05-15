import 'package:bmi_app/conctans/colors/app_colors.dart';
import 'package:bmi_app/screens/home/home_controller.dart';
import 'package:bmi_app/screens/home/home_page.dart';
import 'package:bmi_app/widgets/calculate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/bmi_data.dart';

class Results extends StatelessWidget {
  Results();
  // final double height;
  // final int kg;
  HomeController _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final bmi = BmiData.bmiCalculate(
        _controller.heightValue.value, _controller.weight.value);
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Жыйынтык',
            style: TextStyle(
                color: Color.fromARGB(255, 248, 247, 246),
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.purpleDark,
                borderRadius: BorderRadius.circular(15),
              ),
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Text(
                      BmiData.bmiResult(bmi).toString(),
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff08e82C).withOpacity(0.8)),
                    ),
                  ),
                  Center(
                    child: Text(
                      BmiData.bmiCalculate(_controller.heightValue.value,
                              _controller.weight.value)
                          .toStringAsFixed(1),
                      style: TextStyle(
                          fontSize: 84,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 230, 236, 231)
                              .withOpacity(0.8)),
                    ),
                  ),
                  Center(
                    child: Text(
                      BmiData.giveDescription(bmi).toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 230, 236, 231)
                              .withOpacity(0.8)),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CalculateWidget(
          text: 'Re-calculate',
          onTap: () {
            Get.back();
            // Navigator.pop(context);
          }),
    );
  }
}
