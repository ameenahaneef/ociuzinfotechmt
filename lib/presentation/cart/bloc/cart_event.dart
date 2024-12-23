import 'package:ociuzinfotechmt/data/model/cart_model.dart';

abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final CartItem item;
  AddToCartEvent(this.item);
}

class RemoveFromCartEvent extends CartEvent {
  final CartItem item;
  RemoveFromCartEvent(this.item);
}

class ClearCartEvent extends CartEvent {}
