import 'package:flutter/material.dart';
import 'package:opn_front_1/data/product_http_client.dart';
import 'package:http/http.dart' as http;
import 'package:opn_front_1/product_adding_card.dart';
import 'package:opn_front_1/updating_card.dart';
import 'dart:convert' as convert;

import 'hero_dialog_route.dart';

class ConfirmationCard extends StatefulWidget {
  /// {@macro add_todo_popup_card}
  ConfirmationCard({Key? key, required this.code}) : super(key: key);
  String? code;

  @override
  State<ConfirmationCard> createState() => _ConfirmationCardState();
}

class _ConfirmationCardState extends State<ConfirmationCard> {
  //var client = new ProductHttpClient();
  String productName = "";
  String productPrice = "";
  String productWeightOrVolume = "";
  bool? productHasVolume;
  Future checkProduct(String code) async {
    //print("jonas");
    var url = Uri.http("localhost:5239", "/api/Products/Check", {"code": code});

    // var url = ProductHttp().productCheckingUri(code);

    var response = await http.get(url);

    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;

    productName = jsonResponse["name"];

    productPrice = jsonResponse["price"].toString();

    productWeightOrVolume = jsonResponse["weightOrVolume"].toString();

    productHasVolume = jsonResponse["hasVolume"] as bool;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: checkProduct(widget.code!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (!productHasVolume!) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Hero(
                      tag: "teste",
                      child: Material(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text("Item:"),
                                Text(productName),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 0.2,
                                ),
                                const Text("Preço:"),
                                Text(productPrice),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 0.2,
                                ),
                                const Text("Peso(kg):"),
                                Text(productWeightOrVolume),
                                // FlatButton(
                                //   onPressed: () {},
                                //   child: const Text('Add'),
                                // ),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 0.2,
                                ),
                                const Text("Está tudo certo"),
                                const Text("com este produto?"),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 0.2,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        HeroDialogRoute(builder: (context) {
                                          return AddToProductCard(
                                              code: widget.code);
                                        }),
                                      );
                                    },
                                    child: const Text("Sim")),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 0.2,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        HeroDialogRoute(builder: (context) {
                                          return const UpdateProductCard();
                                        }),
                                      );
                                    },
                                    child: const Text("Não, editar"))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Hero(
                      tag: "teste",
                      child: Material(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text("Item:"),
                                Text(productName),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 0.2,
                                ),
                                const Text("Preço:"),
                                Text(productPrice),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 0.2,
                                ),
                                const Text("Quantidade:"),
                                Text(productWeightOrVolume),
                                // FlatButton(
                                //   onPressed: () {},
                                //   child: const Text('Add'),
                                // ),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 0.2,
                                ),
                                const Text("Está tudo certo"),
                                const Text("com este produto?"),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 0.2,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        HeroDialogRoute(builder: (context) {
                                          return AddToProductCard(
                                              code: widget.code);
                                        }),
                                      );
                                    },
                                    child: const Text("Sim, adicionar")),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 0.2,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        HeroDialogRoute(builder: (context) {
                                          return const UpdateProductCard();
                                        }),
                                      );
                                    },
                                    child: Text("Não, editar"))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
