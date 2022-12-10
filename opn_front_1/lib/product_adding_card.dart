import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opn_front_1/data/product_http_client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'hero_dialog_route.dart';

class AddToProductCard extends StatefulWidget {
  /// {@macro add_todo_popup_card}
  AddToProductCard({Key? key, required this.code}) : super(key: key);
  String? code;

  @override
  State<AddToProductCard> createState() => _AddToProductCardState();
}

class _AddToProductCardState extends State<AddToProductCard> {
  int? productAmount;
  String? region;
  Future addToProduct() async {
    var url = Uri.http("localhost:5239", "/api/Products/Check");
    print(1);
    print(widget.code);
    print(productAmount);
    print(region);

    var response = await http.post(url, body: {
      "code": widget.code,
      "shift": "1",
      "amount": productAmount,
      "supermarketName": region
    });
    print(2);

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: "add-to-product",
          child: Material(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) => productAmount = int.parse(value),
                      decoration: const InputDecoration(
                        hintText: 'Quantidade',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextField(
                      onChanged: (value) {
                        if (value != null) region = value;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Região',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                      maxLines: 6,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (region != null && productAmount != null) {
                            addToProduct()
                                .then((context) => Navigator.pop(context));
                          }
                        },
                        child: const Text("Adicionar"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
