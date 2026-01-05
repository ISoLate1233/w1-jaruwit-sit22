void main(){
  int score = 75;

  String grade = (score >= 80) ? 'A' :
  (score >= 70) ? 'B' :
  (score >= 60) ? 'C' : 'F';

  print('คะแนน: $score ได้เกรด $grade');
}