void main (){
  int a = 10;
  int b = 5;
  print('a + b = ${a + b}');
  print('a - b = ${a - b}');
  print('a * b = ${a * b}');
  print('a / b = ${a / b}');
  print('a % b = ${a % b}');

  a += b;
  print('a += b: $a');

  a -= b;
  print('a -= b: $a');

  a *= b;
  print('a *= b: $a');
}