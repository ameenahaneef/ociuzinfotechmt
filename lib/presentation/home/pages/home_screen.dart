import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ociuzinfotechmt/presentation/cart/pages/cart_screen.dart';
import 'package:ociuzinfotechmt/presentation/home/bloc/product_bloc.dart';
import 'package:ociuzinfotechmt/presentation/home/widgets/card_widget.dart';
import 'package:ociuzinfotechmt/presentation/productdetails/pages/product_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(FetchProducts());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const CartScreen();
                }));
              },
              icon: const Icon(Icons.shopping_bag))
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductLoaded) {
            final products = state.products;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ProductDetails(
                          imageUrl: product.image,
                          name: product.title,
                          description: product.description,
                          price: product.price);
                    }));
                  },
                  child: CardWidget(product: product),
                );
              },
            );
          } else if (state is ProductError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return const Center(
            child: Text("No products available."),
          );
        },
      ),
    );
  }
}

