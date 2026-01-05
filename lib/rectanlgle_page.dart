import 'package:flutter/material.dart';
class RectanglePage extends StatefulWidget{
   RectanglePage({super.key});

  @override
  State<StatefulWidget> createState() => RectanglePageState();

  InputDecoration textFieldStyle =  InputDecoration(
      filled: true,
      fillColor: Colors.black12,
      label: Text("Width"),
      hint: Text("Insert Width"),
      border: OutlineInputBorder()
  );

}

class RectanglePageState extends State<RectanglePage>{
  int width = 0;
  int length = 0;
  int area = 0;
  TextEditingController widthController = TextEditingController();
  TextEditingController lengthController = TextEditingController();

  final InputDecoration _textFieldStyle = InputDecoration(
      filled: true,
      fillColor: Colors.black12,
      border: OutlineInputBorder()
  );


  void  _calRectangle(){
    width = int.tryParse(widthController.text)?? 0;
    length = int.tryParse(lengthController.text)?? 0;

    setState(() {
      area = width * length;
    });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text("Calculation Square"), centerTitle: true,),
     body: Column(children: [
       SizedBox(height: 30,),
       Text("width $width m. legth $length m. area $area m.", style: TextStyle(fontSize: 22),),
       SizedBox(height: 30,),
       TextField(
         controller: widthController,
         decoration: _textFieldStyle.copyWith(label: Text("Width"),hint: Text("Insert Width")),
       ),
       SizedBox(height: 20,),
       TextField(
           controller: lengthController,
           decoration: _textFieldStyle.copyWith(label: Text("legth"),hint: Text("Insert length"))
       ),
       SizedBox(height: 30,),
       ElevatedButton(onPressed: (  ) =>_calRectangle(), child: Text("Calculate"))
     ],),
   );
  }

}