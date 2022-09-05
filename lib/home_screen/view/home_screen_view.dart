import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_printer_example/home_screen/controller/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Pos Printer App"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await controller.printPaper();
              },
              icon: const Icon(Icons.print)),
          const SizedBox(
            width: 32,
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(
            () => controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Expanded(
                          child: ListView.separated(
                            itemCount: controller.printerList.length,
                            separatorBuilder: (context, index) => const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(controller.printerList[index].name!),
                                      Obx(() => Checkbox(
                                          value: controller.selectedIndex == index,
                                          onChanged: (_) {
                                            controller.selectedIndex = index;
                                          }))
                                    ],
                                  ),
                                ),
                              );
                            })),
                    ],
                  ),
          )),
    );
  }
}
