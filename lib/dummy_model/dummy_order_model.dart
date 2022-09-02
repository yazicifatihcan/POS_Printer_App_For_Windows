import 'package:pos_printer_example/dummy_model/order_model.dart';

final DummyOrderModel dummyOrderModel= DummyOrderModel(

customerName: "Fatih Can Yazıcı",
id: 61,
items: [
  Item(itemCount: 3,itemName: "Hamburger",totalAmount: 150),
  Item(itemCount: 5,itemName: "Pasta",totalAmount: 250),
  Item(itemCount: 1,itemName: "Salad",totalAmount: 30),
],
totalAmount: 430,

);