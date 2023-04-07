import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {required this.tus,
      required this.icon,
      required this.text,
      required this.onTap});

  final IconData icon;
  final String text;
  final Color tus;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          color: tus,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(
                icon,
                size: 90,
                color: Color(0xffFFFFFF),
              ),
              Text(
                text.toUpperCase(),
                style: TextStyle(
                  color: Color(0xffFFFFFFFF),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
