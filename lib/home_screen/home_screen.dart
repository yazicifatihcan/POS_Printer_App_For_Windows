import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_printer_example/home_screen/controller/home_screen_controller.dart';
import 'package:pos_printer_example/home_screen/view/home_screen_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeScreenController(),
      builder: (_)=>const HomeScreenView(),
    );
  }
}