import 'dart:math';

import 'package:bmi_app/screens/resalts.dart';
import 'package:bmi_app/widgets/weightAge.dart';
import 'package:flutter/material.dart';

import '../conctans/colors/app_colors.dart';
import '../widgets/calculate.dart';
import '../widgets/custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color maleColor = AppColors.purpleDark;
  Color femaleColor = AppColors.purpleDark;
  double heightValue = 70;
  int weight = 60;
  int age = 20;
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
              CustomContainer(
                onTap: () {
                  setState(() {
                    maleColor = AppColors.activeColor;
                    femaleColor = AppColors.purpleDark;
                  });
                },
                icon: Icons.male,
                text: 'Male',
                tus: maleColor,
              ),
              CustomContainer(
                onTap: () {
                  setState(() {
                    femaleColor = AppColors.activeColor;
                    maleColor = AppColors.purpleDark;
                  });
                },
                icon: Icons.female,
                text: 'Female',
                tus: femaleColor,
              ),
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
                      Text(
                        heightValue.toStringAsFixed(1),
                        style: const TextStyle(
                            color: AppColors.String,
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                            color: AppColors.String,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Slider(
                      activeColor: Colors.amber,
                      inactiveColor: Colors.black,
                      thumbColor: Colors.blue,
                      max: 220,
                      value: heightValue,
                      onChanged: (userChange) {
                        heightValue = userChange;
                        setState(() {});
                      })
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeightAge(
                  title: 'Weight',
                  number: weight.toString(),
                  onPressedMinus: () {
                    setState(() {
                      weight--;
                    });
                  },
                  onPressedPlus: () {
                    setState(() {
                      weight++;
                    });
                  }),
              WeightAge(
                  title: 'Age',
                  number: age.toString(),
                  onPressedMinus: () {
                    setState(() {
                      age--;
                    });
                  },
                  onPressedPlus: () {
                    setState(() {
                      age++;
                    });
                  }),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CalculateWidget(
        text: 'Calculate',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Resalts(height: heightValue, kg: weight),
            ),
          );
        },
      ),
    ));
  }
}
