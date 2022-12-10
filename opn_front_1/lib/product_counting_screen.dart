import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:opn_front_1/data/product_http_client.dart';
import 'package:opn_front_1/todobutton.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'confirmation_card.dart';
import 'hero_dialog_route.dart';
import 'models/product.dart';

class ProductCountingScreen extends StatefulWidget {
  ProductCountingScreen({super.key});
  String? code;

  @override
  State<ProductCountingScreen> createState() => _ProductCountingScreenState();
}

class _ProductCountingScreenState extends State<ProductCountingScreen> {
  var client = ProductHttp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: // AddTodoButton(),
            FloatingActionButton(
          backgroundColor: Colors.green,
          heroTag: "product-check-card",
          onPressed: () {
            Navigator.of(context).push(
              HeroDialogRoute(builder: (context) {
                return ProductCheckCard();
              }),
            );
          },
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 28, 146, 32),
        ),
        body: Container(
          alignment:
              Alignment.lerp(Alignment.topCenter, Alignment.bottomCenter, .3),
          child: Builder(
            builder: (context) {
              if (true) {
                return FractionallySizedBox(
                  heightFactor: 0.7,
                  widthFactor: 0.8,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 154, 28, 19),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.lerp(
                              Alignment.topCenter, Alignment.center, 0.5)!,
                          child: const Text(
                            "Valor Total Arrecadado: ",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Align(
                          alignment: Alignment.lerp(
                              Alignment.topCenter, Alignment.center, 0.8)!,
                          child: const Text(
                            "Peso Total Arrecadado: ",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class ProductCheckCard extends StatefulWidget {
  /// {@macro add_todo_popup_card}
  ProductCheckCard({Key? key}) : super(key: key);

  @override
  State<ProductCheckCard> createState() => _ProductCheckCardState();
}

class _ProductCheckCardState extends State<ProductCheckCard> {
  String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: "product-check-card",
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
                      decoration: const InputDecoration(
                        hintText: 'Código de barras',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                      onChanged: (value) => text = value,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (text != null) {
                          Navigator.of(context).push(
                            HeroDialogRoute(builder: (context) {
                              return ConfirmationCard(
                                code: text,
                              );
                            }),
                          );
                        }
                      },
                      child: Text("Buscar produto"),
                    ),
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

class RegisterProductCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const RegisterProductCard({Key? key}) : super(key: key);

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
                        hintText: 'Peso(kg)',
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
                        child: Text("Registrar"))
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
