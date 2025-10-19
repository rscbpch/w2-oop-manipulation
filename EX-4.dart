enum DeliveryTypes { DELIVERY, PICKUP }

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});

  @override
  String toString() => 'Product(name: $name, price: $price)';
}

class Orderitem {
  final Product product;
  final int quality;

  Orderitem({required this.product, required this.quality});

  double total() => product.price * quality;

  @override
  String toString() =>
      '(product: ${product.name}, quality: $quality, total: ${total()})';
}

class Order {
  final List<Orderitem> items;
  final DeliveryTypes deliveryTypes;
  final String address;

  Order({
    required this.items,
    required this.deliveryTypes,
    required this.address,
  });

  double getTotalPrice() {
    double result = 0.0;
    for (var item in items) {
      result += item.total();
    }
    return result;
  }

  @override
  String toString() {
    return ('Order item: $items\n'
        'Type: $deliveryTypes\n'
        'Total price: ${getTotalPrice()}');
  }
}

void main() {
  Product p1 = Product(name: 'glass', price: 8);
  Product p2 = Product(name: 'mug', price: 5.5);

  Orderitem o1 = Orderitem(product: p1, quality: 2);
  Orderitem o2 = Orderitem(product: p2, quality: 6);

  Order order = Order(
    items: [o1, o2],
    deliveryTypes: DeliveryTypes.PICKUP,
    address: 'Phnum Penh',
  );

  print(order);
}
