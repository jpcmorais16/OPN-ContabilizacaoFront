import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/product.dart';

class ProductHttpClient {
  String baseUrl = "";
  Future<Product> checkProduct(String code) async {
    var url = Uri.http(baseUrl, "", {"code": code});

    var response = await http.get(url);

    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;

    var product = Product(jsonResponse["name"], jsonResponse["Price"],
        jsonResponse["WeightOrVolume"], jsonResponse["HasVolume"]);

    return product;
  }

  // Future<HttpClientResponse> addToProduct() async {}
  // Future<HttpClientResponse> registerProduct() async {}
  // Future<HttpClientResponse> updateProduct() async {}
}
