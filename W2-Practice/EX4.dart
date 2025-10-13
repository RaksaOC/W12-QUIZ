enum Item { computer, phone, tablet }

const Map<Item, double> itemPrices = {
  Item.computer: 1000.0,
  Item.phone: 500.0,
  Item.tablet: 300.0,
  
};

class Cart {
  List<Map<String, dynamic>> items = [];

  void addItem(Item itemName, int quantity) {
    items.add({'item': itemName, 'quantity': quantity});
  }

  // getting the total price for the cart
  double getTotalPrice() {
    double total = 0.0;
    for (var item in items) {
      total += itemPrices[item['item']]! * item['quantity'];
    }
    return total;
  }

}

void main() {

  Cart cart = Cart();

  cart.addItem(Item.computer, 1);
  cart.addItem(Item.phone, 2);
  cart.addItem(Item.tablet, 3);

  print('Total Cart Price: ${cart.getTotalPrice()}');
}
