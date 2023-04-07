import 'package:flutter/material.dart';

class WeightAge extends StatelessWidget {
  const WeightAge({
    super.key,
    required this.onPressedMinus,
    required this.onPressedPlus,
    this.title,
    this.number,
  });

  final void Function()? onPressedMinus;

  final void Function()? onPressedPlus;
  final String? title;
  final String? number;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff0c0220),
        borderRadius: BorderRadius.circular(15),
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.29,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Text(
            title!.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          Text(
            "$number",
            style: const TextStyle(
                color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: onPressedMinus,
                child: Icon(
                  Icons.remove,
                  size: 20,
                ),
              ),
              FloatingActionButton(
                onPressed: onPressedPlus,
                child: Icon(
                  Icons.add,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
