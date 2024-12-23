import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ociuzinfotechmt/data/model/cart_model.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<AddToCartEvent>((event, emit) {
      List<CartItem> updatedCartItems = List.from(state.cartItems);
      int index = updatedCartItems.indexWhere((item) => item.name == event.item.name);

      if (index == -1) {
        updatedCartItems.add(event.item);  
      } else {
        updatedCartItems[index].quantity++;  
      }

      emit(CartLoadedState(cartItems: updatedCartItems));  
    });

    on<RemoveFromCartEvent>((event, emit) {
      List<CartItem> updatedCartItems = List.from(state.cartItems);
      updatedCartItems.remove(event.item); 
      emit(CartLoadedState(cartItems: updatedCartItems));  
    });

    on<ClearCartEvent>((event, emit) {
      emit(CartInitialState());  
    });
  }
}
