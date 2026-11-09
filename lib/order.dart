class Order {
  final String itemName;
  final int quantity;
  final double unitPrice;

  const Order({
    required this.itemName,
    required this.quantity,
    required this.unitPrice,
  });
}

double orderTotal(Order order) {
  return order.quantity * order.unitPrice;
}