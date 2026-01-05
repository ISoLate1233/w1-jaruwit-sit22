import 'package:flutter/material.dart';
import 'dart:math'; // ต้องใช้เพื่อเรียก pi และ pow

class SpherePage extends StatefulWidget {
  const SpherePage({super.key});

  @override
  State<StatefulWidget> createState() => SpherePageState();
}

class SpherePageState extends State<SpherePage> {
  // กำหนดตัวแปรสำหรับรัศมีและผลลัพธ์
  double radius = 0;
  double volume = 0;

  TextEditingController radiusController = TextEditingController();

  // สร้าง Style แยกไว้
  final InputDecoration _textFieldStyle = const InputDecoration(
      filled: true,
      fillColor: Colors.black12,
      border: OutlineInputBorder()
  );

  // ฟังก์ชันคำนวณ
  void _calSphere() {
    setState(() {
      radius = double.tryParse(radiusController.text) ?? 0;
      // สูตรปริมาตรทรงกลม: (4/3) * pi * r^3
      volume = (4 / 3) * pi * pow(radius, 3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sphere Volume Calculation"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            // ส่วนแสดงผล
            Text(
              "Radius: ${radius.toStringAsFixed(2)} m.",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Volume: ${volume.toStringAsFixed(2)} m³",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 30),
            // ช่องกรอกค่ารัศมี
            TextField(
              controller: radiusController,
              keyboardType: TextInputType.number, // ให้คีย์บอร์ดโชว์ตัวเลข
              decoration: _textFieldStyle.copyWith(
                label: const Text("Radius (r)"),
                hintText: "Insert Radius",
              ),
            ),
            const SizedBox(height: 30),
            // ปุ่มกดคำนวณ
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _calSphere, // เรียกใช้ฟังก์ชันที่สร้างไว้
                child: const Text("Calculate Volume", style: TextStyle(fontSize: 18)),
              ),
            )
          ],
        ),
      ),
    );
  }
}