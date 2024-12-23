import 'dart:convert';

import 'package:ociuzinfotechmt/core/constants/api_endpoints.dart';
import 'package:ociuzinfotechmt/data/model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService{
  Future<List<Product>> fetchProducts() async {
     final url = Uri.parse(ApiEndpoints.getUrl);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);

        List<Product> products = jsonData.map((item) => Product.fromJson(item)).toList();

        return products;
      } else {
        throw Exception("Failed to load products. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching products: $e");
    }
  }
}