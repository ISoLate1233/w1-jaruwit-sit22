import 'package:flutter/material.dart';
import 'package:w3_jaruwit/api_service.dart';
import 'package:w3_jaruwit/product_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Product>>(future: ApiService.fetchProduct(), builder: (context , snapshot){
        //กรณีรอข้อมูล
        if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
        }

        //กรณีError
        if(snapshot.hasError){
          return Center(child: Text("เกิดข้อผิดพลาด"),);
        }

        final products =snapshot.data!;
        return ListView.builder(itemCount: products.length,itemBuilder: (context, index){
          final p = products[index];
          return Card(
            // 1. เพิ่มเงาและความโค้งให้ดูเป็น Card
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12.0), // เว้นระยะขอบด้านใน
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. จัดการรูปภาพให้สวยงามและมุมโค้ง
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      p.photo,
                      width: 100,
                      height: 100, // เพิ่มความสูงให้สมดุล
                      fit: BoxFit.cover, // ให้รูปเต็มพื้นที่โดยไม่เบี้ยว
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error, size: 50, color: Colors.grey), // กัน error หากรูปโหลดไม่ได้
                    ),
                  ),
                  const SizedBox(width: 16), // เว้นระยะห่างระหว่างรูปกับข้อความ

                  // 3. ส่วนข้อความ (ใช้ Expanded เพื่อกันข้อความยาวเกินจอ)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // ชิดซ้าย
                      children: [

                        Text(
                          p.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis, // ถ้าชื่อยาวเกินให้เป็น ...
                        ),
                        const SizedBox(height: 4),

                        // ราคา (สีเด่นๆ เช่น สีเขียว หรือสีตาม Theme)
                        Text(
                          '฿${p.price}', // ใส่หน่วยเงิน
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),

                        // น้ำหนัก (ตัวเล็ก สีเทา)
                        Text(
                          'น้ำหนัก: ${p.weight} กก.',
                          style: TextStyle(color: Colors.grey[600], fontSize: 14),
                        ),
                        const SizedBox(height: 8),

                        // คำอธิบาย (จำกัดบรรทัด)
                        Text(
                          p.description,
                          style: TextStyle(color: Colors.grey[800], fontSize: 14),
                          maxLines: 2, // โชว์แค่ 2 บรรทัด
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );        }


        );
      },
      ));
  }
}
