import 'package:flutter/material.dart';
import 'package:opn_front_1/data/product_http_client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'hero_dialog_route.dart';

class UpdateProductCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const UpdateProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: "update",
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
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Item',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Peso',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Preço',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Atualizar"))
                    // FlatButton(
                    //   onPressed: () {},
                    //   child: const Text('Add'),
                    // ),
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
