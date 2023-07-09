import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   String data = '';

  final TextEditingController textController = TextEditingController();
  
  //save data functions
  Future<void> _saveString(String txt) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("MyKey",txt);
    textController.clear();
  }
  // load data function
  Future<void> _loadString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    data = prefs.getString(key) ?? "هیچ داده ای یافت نشد";
  }

  Future<void> _deleteString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
    data = '';
  }

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
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: textController,
              ),
            ),

            const SizedBox(height: 16),

            // buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Load Data Btn
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _loadString("MyKey");
                      });
                    },
                    child: const Text("Load Data")),
                //delete data
                ElevatedButton(
                    onPressed: () {
                     setState(() {
                       _deleteString("MyKey");
                     });
                    },
                    child: const Text("Delete Data")),
                // Save Data Btn
                ElevatedButton(
                    onPressed: () {
                      if(textController.text.isNotEmpty){
                        _saveString(textController.text);
                      }
                    },
                    child: const Text("Save Data")),
              ],
            ),

            const SizedBox(height: 24),
            //txt
             Text(data,style: const TextStyle(fontSize: 16))
            
          ],
        ),
      ),
    );
  }
}
