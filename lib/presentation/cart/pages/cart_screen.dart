import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ociuzinfotechmt/presentation/cart/bloc/cart_bloc.dart';
import 'package:ociuzinfotechmt/presentation/cart/bloc/cart_state.dart';
import 'package:ociuzinfotechmt/presentation/cart/widgets/listview_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitialState) {
            return const Center(child: Text("Your cart is empty"));
          }

          final cartItems = state.cartItems;
          final totalPrice = state.totalPrice;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListviewWidget(cartItems: cartItems),
                ),
                const Divider(),
                Text(
                  "Total: \$${totalPrice.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Checkout Successful!")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 12.0,
                      ),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    child: const Text("Checkout"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

