import 'package:pos_printer_example/dummy_model/order_model.dart';
import 'package:pos_printer_example/extension/string_extension.dart';
import 'package:pos_printer_example/general/printer_manager.dart';
import 'package:pos_printer_manager/pos_printer_manager.dart';

class ReceiptDesignManager {
  Generator generator = CustomUsbPrinterManager.instance.generator;
  CapabilityProfile profile = CustomUsbPrinterManager.instance.profile;

  
  
  List<int> createExampleReceipt(DummyOrderModel dummyOrderModel) {
    List<int> byte = [];

    //generator.text command takes 1 line and adds the child text to that line 
    byte += generator.text("Order Receipt".withoutDiacriticalMarks,
        styles: const PosStyles(align: PosAlign.center, bold: true));

    // generator.hr command fills the line with the character you give as a "ch" parameter. Basically it's a seperator.
    byte += generator.hr(ch: "-");

    //When POS printers skip the line they are not able to come back and print something to line above.
    //If we want to print things to the same row first we have to create PosColumn and then put them into the same row.
    //Each row has a maximum 12 width. The colums that we gave must have total 12 widht otherwise it will throw error.
    var col1 =
        PosColumn(text: "Order No".withoutDiacriticalMarks, width: 6, styles: const PosStyles(align: PosAlign.left));
    var col2 = PosColumn(
        text: dummyOrderModel.id!.toString().withoutDiacriticalMarks,
        width: 6,
        styles: const PosStyles(align: PosAlign.left));
    byte += generator.row([col1, col2]);


    byte += generator.hr(ch: "-");

    //Creating row for each item in order.
    for (var orderItem in dummyOrderModel.items!) {
      var col3 = PosColumn(
          text: "x${orderItem.itemCount.toString()}".withoutDiacriticalMarks,
          width: 1,
          styles: const PosStyles(align: PosAlign.left));
      var col4 = PosColumn(
          text: orderItem.itemName!.withoutDiacriticalMarks, width: 8, styles: const PosStyles(align: PosAlign.left));
      var col5 = PosColumn(
          text: orderItem.totalAmount.toString().withoutDiacriticalMarks,
          width: 3,
          styles: const PosStyles(align: PosAlign.left));
      byte += generator.row([col3, col4, col5]);
    }

    
    byte += generator.text("TOTAL AMOUNT: ${dummyOrderModel.totalAmount.toString()}",
        styles: const PosStyles(align: PosAlign.right, bold: true));

    return byte;
  }
}
