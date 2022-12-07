import 'package:flutter/material.dart';

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
                  Align(
                    alignment: Alignment.lerp(
                        Alignment.bottomCenter, Alignment.center, 0.4)!,
                    child: FloatingActionButton(
                        backgroundColor: const Color.fromARGB(255, 28, 146, 32),
                        onPressed: () {}),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
