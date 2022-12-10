import 'package:flutter/material.dart';

class Product {
  Product(this.name, this.price, this.weightOrVolume, this.hasVolume) {
    print("jonas");
    print(this.name);
  }

  String name;
  String price;
  String weightOrVolume;
  bool hasVolume;
}
