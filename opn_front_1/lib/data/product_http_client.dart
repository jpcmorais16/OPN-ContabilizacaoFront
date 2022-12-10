import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/product.dart';

class ProductHttp {
  String baseUrl = "localhost:5239";
  Uri productCheckingUri(String code) {
    return Uri.http(baseUrl, "/api/Product/Check", {"code": code});
  }

  // Future<HttpClientResponse> addToProductUri() async {}
  // Future<HttpClientResponse> registerProductUri() async {}
  // Future<HttpClientResponse> updateProductUri() async {}
}
