import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ociuzinfotechmt/data/repository/api_service.dart';
import 'package:ociuzinfotechmt/presentation/cart/bloc/cart_bloc.dart';
import 'package:ociuzinfotechmt/presentation/home/bloc/product_bloc.dart';
import 'package:ociuzinfotechmt/presentation/home/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(ApiService()),
        ),
        BlocProvider(create: (context) => CartBloc())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen()),
    );
  }
}
