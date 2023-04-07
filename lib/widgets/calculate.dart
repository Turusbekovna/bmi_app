import 'package:flutter/material.dart';

import '../conctans/colors/app_colors.dart';

class CalculateWidget extends StatelessWidget {
  const CalculateWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.Container,
        ),
        height: MediaQuery.of(context).size.height * 0.09,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppColors.String,
            ),
          ),
        ),
      ),
    );
  }
}
