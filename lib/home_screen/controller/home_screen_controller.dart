import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_printer_example/general/receipt_design.dart';
import 'package:pos_printer_manager/pos_printer_manager.dart';

import '../../dummy_model/dummy_order_model.dart';
import '../../general/printer_manager.dart';

class HomeScreenController extends GetxController{

final scaffoldKey=GlobalKey<ScaffoldState>();

RxBool _isLoading=false.obs;

RxInt _selectedIndex=0.obs;

int get selectedIndex=> _selectedIndex.value;

set selectedIndex(int value)=>_selectedIndex.value=value;

bool get isLoading =>_isLoading.value;

set isLoading(value)=>_isLoading.value=value;

BuildContext get context=>scaffoldKey.currentContext!;

RxList<USBPrinter> _printerList=RxList<USBPrinter>([]);

set printerList(value){
  _printerList.firstRebuild=true;
  _printerList.value=value;
}

List<USBPrinter>  get printerList=>_printerList.value;


@override
  void onReady() async{
    isLoading=true;
    printerList=await CustomUsbPrinterManager.instance.discoverPrinterList();
    isLoading=false;
    super.onReady();
  }

  Future<void> printPaper()async{
    isLoading=true;
    await CustomUsbPrinterManager.instance.printPaper(printerList[selectedIndex], ReceiptDesignManager().createExampleReceipt(dummyOrderModel));
    isLoading=false;
  }


}