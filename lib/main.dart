import 'package:flutter/material.dart';
import 'cycle_page.dart';
import 'rectanlgle_page.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black26),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/rectangle page': (context) => RectanglePage(),
        '/cycle page' : (context) => const SpherePage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Menu")),
      body: Center(
        // ใช้ Column เพื่อวางปุ่มเรียงต่อกันลงมา
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => {Navigator.pushNamed(context, '/rectangle page')},
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                fixedSize: const Size(200, 50),
              ),
              child: const Text("Calculation Square"),
            ),

            const SizedBox(height: 20),

            // ปุ่มไปหน้าปริมาตรทรงกลมที่เพิ่มเข้ามาใหม่
            TextButton(
              onPressed: () => {Navigator.pushNamed(context, '/cycle page')},
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue, // ใช้สีฟ้าเพื่อให้ต่างจากปุ่มแรก
                foregroundColor: Colors.white,
                fixedSize: const Size(200, 50),
              ),
              child: const Text("Sphere Volume"),
            ),
          ],
        ),
      ),
    );
  }
}