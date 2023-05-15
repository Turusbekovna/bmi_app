import 'package:bmi_app/screens/home/home_controller.dart';

import 'package:bmi_app/widgets/weightAge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../conctans/colors/app_colors.dart';
import '../../widgets/calculate.dart';
import '../../widgets/custom.dart';
import '../results/results.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(
                color: AppColors.String, fontFamily: AutofillHints.birthday),
          ),
        ),
        backgroundColor: AppColors.mainColor,
        elevation: BorderSide.strokeAlignOutside,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Obx(() => CustomContainer(
                    onTap: _homeController.male,
                    icon: Icons.male,
                    text: 'Male',
                    tus: _homeController.maleColor.value,
                  )),
              Obx(() => CustomContainer(
                    onTap: _homeController.female,
                    icon: Icons.female,
                    text: 'Female',
                    tus: _homeController.femaleColor.value,
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: AppColors.purpleDark,
                borderRadius: BorderRadius.circular(30)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Height'.toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.String,
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Obx(() => Text(
                            _homeController.heightValue.toStringAsFixed(1),
                            style: const TextStyle(
                                color: AppColors.String,
                                fontSize: 60,
                                fontWeight: FontWeight.bold),
                          )),
                      Text(
                        'cm',
                        style: TextStyle(
                            color: AppColors.String,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Obx(() => Slider(
                      activeColor: Colors.amber,
                      inactiveColor: Colors.black,
                      thumbColor: Colors.blue,
                      max: 220,
                      value: _homeController.heightValue.value,
                      onChanged: (userChange) {
                        _homeController.heightValue.value = userChange;
                        // setState(() {});
                      }))
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WeightAge(
                      title: 'Weight',
                      number: _homeController.weight.value.toString(),
                      onPressedMinus: _homeController.minusweight,
                      onPressedPlus: _homeController.plusweight),
                  WeightAge(
                    title: 'Age',
                    number: _homeController.age.value.toString(),
                    onPressedMinus: _homeController.minusAge,
                    onPressedPlus: _homeController.plusAge,
                  ),
                ],
              )),
        ],
      ),
      bottomNavigationBar: CalculateWidget(
        text: 'Calculate',
        onTap: () {
          Get.to(Results());
        },
      ),
    ));
  }
}
