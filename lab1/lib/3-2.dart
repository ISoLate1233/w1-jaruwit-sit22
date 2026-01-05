void main() {
  List<String> list1 = ['แมว', 'หมา', 'นก'];
  List<String> list2 = ['นกขุนทอง', 'หมาเปอร์เซีย', 'หมูขาว', 'ลามะ'];

  showList(list1);
  showList(list2);
}

void showList(List<String> animals) {
  String result = '';

  for (int i = 0; i < animals.length; i++) {
    result += '${i + 1}) "${animals[i]}" ';
  }

  result += 'รวม ${animals.length} ตัว';

  print(result);
}
