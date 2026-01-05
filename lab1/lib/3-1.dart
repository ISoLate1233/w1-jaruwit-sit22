void main(){
  var  a = [1,2,3,4];
  var b =[2,4,6,8];

  int r1 = sumNumber(a);
  int r2 = sumNumber(b);

  print("sum 1 = $r1");
  print("sum 2 = $r2");
}
int sumNumber(List<int> number){
  int sum =0;

  for(int x in number){
    sum += x;
  }
  return sum;
}