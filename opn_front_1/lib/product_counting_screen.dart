import 'package:flutter/material.dart';
import 'package:opn_front_1/todobutton.dart';

import 'hero_dialog_route.dart';

class ProductCountingScreen extends StatefulWidget {
  const ProductCountingScreen({super.key});

  @override
  State<ProductCountingScreen> createState() => _ProductCountingScreenState();
}

class _ProductCountingScreenState extends State<ProductCountingScreen> {
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
                return const ProductCheckCard();
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
          child: FractionallySizedBox(
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
          ),
        ),
      ),
    );
  }
}

class ProductCheckCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const ProductCheckCard({Key? key}) : super(key: key);

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
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Código de barras',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
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
                        Navigator.of(context).push(
                          HeroDialogRoute(builder: (context) {
                            return const ConfirmationCard();
                          }),
                        );
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

class ConfirmationCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const ConfirmationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: "teste",
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
                    const Text("Item"),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    const Text("Preço"),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    Text("Peso"),
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
                              return const AddToProductCard();
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
}

class AddToProductCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const AddToProductCard({Key? key}) : super(key: key);

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
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Quantidade',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    const TextField(
                      decoration: InputDecoration(
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
                        onPressed: () => Navigator.pop(context),
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
