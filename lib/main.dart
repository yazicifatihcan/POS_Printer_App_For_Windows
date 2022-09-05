import 'package:flutter/material.dart';
import 'package:pos_printer_example/home_screen/home_screen.dart';
import 'package:pos_printer_example/general/printer_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CustomUsbPrinterManager.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "POS Printer Windows App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
