import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TipHub',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Shared Preferences"),
        centerTitle: true,
      ),
      body:  SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // text field
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: TextField(

              ),
            ),
            // buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Load Data Btn
                ElevatedButton(
                    onPressed: () {},
                    child: const Text("Load Data")),
                // Save Data btn
                ElevatedButton(
                    onPressed: () {},
                    child: const Text("Save Data")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
