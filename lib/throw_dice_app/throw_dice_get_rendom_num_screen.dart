import 'dart:math';
import 'package:flutter/material.dart';

class DiceAppNextScreen extends StatefulWidget {
  DiceAppNextScreen({required this.name, Key? key}) : super(key: key);
  String name;

  @override
  State<DiceAppNextScreen> createState() => _DiceAppNextScreenState();
}

class _DiceAppNextScreenState extends State<DiceAppNextScreen> {
  int leftImage = 1;
  int rightImage = 2;
  String username = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: const Text(
          "Throw dice and get result",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.name, style: const TextStyle(fontSize: 30)),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // chrome
                // Expanded(child: Image.network("assets/images/$leftImage.png")),
                Expanded(child: Image.asset("assets/images/$leftImage.png")),
                const SizedBox(
                  width: 15,
                ),
                // chrome
                // Expanded(child: Image.network("assets/images/$rightImage.png")),
                Expanded(child: Image.asset("assets/images/$rightImage.png")),
                /// for emulator
                ///    Expanded(child: Image.asset("assets/images/$leftImage.png")),
                //     Expanded(child: Image.asset("assets/images/$rightImage.png")),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                wordSpacing: 0.5,
                letterSpacing: 0.3,
              ),
              backgroundColor: Colors.deepPurple[400],
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8.0), // Button border radius
              ),
            ),
            onPressed: () {
              setState(() {
                leftImage = Random().nextInt(6) + 1;
                rightImage = Random().nextInt(6) + 1;
              });
            },
            child: const Text("Click here for throw dices"),
          )
        ],
      ),
    );
  }
}
