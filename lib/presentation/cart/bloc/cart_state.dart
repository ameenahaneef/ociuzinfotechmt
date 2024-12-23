import 'package:ociuzinfotechmt/data/model/cart_model.dart';


class CartState {
  final List<CartItem> cartItems;

  CartState({required this.cartItems});

  double get totalPrice {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }
}

class CartInitialState extends CartState {
  CartInitialState() : super(cartItems: []);
}

class CartLoadedState extends CartState {
  CartLoadedState({required List<CartItem> cartItems}) : super(cartItems: cartItems);
}
