void main() {
  double weight = 99.0; // kg
  double height = 180.0; // cm

  double heightInMeters = height / 100;

  double bmi = weight / (heightInMeters * heightInMeters);

  print('น้ำหนัก: $weight kg, ส่วนสูง: $height cm');
  print('BMI = ${bmi.toStringAsFixed(2)}');

  if (bmi < 18.5) {
    print('BMI: ผอม');
  } else if (bmi >= 18.5 && bmi < 25) {
    print('BMI: ปกติ');
  } else if (bmi >= 25 && bmi < 30) {
    print('BMI: น้ำหนักเกิน');
  } else {
    print('BMI: อ้วน');
  }
}