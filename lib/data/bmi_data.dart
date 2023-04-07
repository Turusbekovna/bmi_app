import 'dart:math';

class BmiData {
  static bmiCalculate(double height, int kg) {
    final bmiJoop = kg / pow(height / 100, 2);
    return bmiJoop;
  }

  static String? bmiResult(double bmiJoop) {
    if (bmiJoop >= 25) {
      return 'Семиз';
    } else if (bmiJoop > 18.5) {
      return 'Норма';
    } else if (bmiJoop < 18.5) {
      return 'Арык';
    }
    return null;
  }

  static String? giveDescription(double bmiJoop) {
    if (bmiJoop >= 25) {
      return 'Код жазып отура бербей кыймылдаңыз';
    } else if (bmiJoop > 18.5) {
      return 'Норма эле экенсизю жазуудан баш көтөрбөңүз';
    } else if (bmiJoop < 18.5) {
      return 'Семириңиз';
    }
    return null;
  }
}
