import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ociuzinfotechmt/data/model/cart_model.dart';
import 'package:ociuzinfotechmt/data/model/product_model.dart';
import 'package:ociuzinfotechmt/presentation/cart/bloc/cart_bloc.dart';
import 'package:ociuzinfotechmt/presentation/cart/bloc/cart_event.dart';
import 'package:ociuzinfotechmt/presentation/cart/pages/cart_screen.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              product.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<CartBloc>().add(
                        AddToCartEvent(
                          CartItem(
                              imageUrl: product
                                  .image, 
                              price: product.price,
                              name: product.title,
                              quantity:
                                  1 
                              ),
                        ),
                      );
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const CartScreen();
                    },
                  ));
                },
                child: const Text('Add to cart'))
          ],
        ),
      ),
    );
  }
}
