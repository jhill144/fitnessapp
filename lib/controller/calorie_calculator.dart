import '../models/user_info.dart';

class CalorieCalculator {
  double calculateBMR(UserInfo userInfo) {
    // Placeholder for BMR calculation
    return 10 * userInfo.weight + 6.25 * userInfo.height - 5 * userInfo.age + 5;
  }

  double calculateTDEE(double bmr, String activityLevel) {
    // Adjust BMR based on activity level
    // This is a simplified example
    return bmr * 1.2;
  }

  double calculateCaloriesToBurn(UserInfo userInfo, double tdee) {
    if (userInfo.goal == 'Lose Weight') {
      return tdee - 500;
    } else if (userInfo.goal == 'Gain Muscle') {
      return tdee + 500;
    } else {
      return tdee;
    }
  }
}
