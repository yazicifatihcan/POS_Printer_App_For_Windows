class DummyOrderModel {
    DummyOrderModel({
        this.id,
        this.items,
        this.customerName,
        this.totalAmount,
    });

    int? id;
    List<Item>? items;
    String? customerName;
    double? totalAmount;
}

class Item {
    Item({
        this.itemName,
        this.itemCount,
        this.totalAmount,
    });

    String? itemName;
    int? itemCount;
    double? totalAmount;

}
