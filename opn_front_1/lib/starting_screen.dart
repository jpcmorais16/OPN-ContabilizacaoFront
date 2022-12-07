import 'package:flutter/material.dart';
import 'package:opn_front_1/product_counting_screen.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 28, 146, 32),
        ),
        body: Container(
          alignment:
              Alignment.lerp(Alignment.topCenter, Alignment.bottomCenter, .3),
          child: FractionallySizedBox(
            heightFactor: 0.5,
            widthFactor: 0.8,
            child: Container(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.lerp(
                        Alignment.topCenter, Alignment.center, 0.4)!,
                    child: const Text(
                      "Bora contabilizar?",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.lerp(
                        Alignment.bottomCenter, Alignment.center, 0.4)!,
                    child: ElevatedButton(
                        child: Text("Começar"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductCountingScreen(),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }
}
