import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ociuzinfotechmt/core/constants/app_colors.dart';
import 'package:ociuzinfotechmt/data/model/cart_model.dart';
import 'package:ociuzinfotechmt/presentation/cart/bloc/cart_bloc.dart';
import 'package:ociuzinfotechmt/presentation/cart/bloc/cart_event.dart';

class ListviewWidget extends StatelessWidget {
  const ListviewWidget({
    super.key,
    required this.cartItems,
  });

  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final cartItem = cartItems[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.network(
                  cartItem.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
               height16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      height8,
                      Text(
                        "\$${cartItem.price.toStringAsFixed(2)} x ${cartItem.quantity}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(RemoveFromCartEvent(cartItem));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
