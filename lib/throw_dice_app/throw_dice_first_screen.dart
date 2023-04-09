import 'package:flutter/material.dart';
import '../emi_calculator/monthly_emi_calculator_screen.dart';
import 'throw_dice_get_rendom_num_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String? userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: const Text("Throw dice and get random num."),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MonthlyEmiCalculator(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            onChanged: (value) {
              setState(() {
                userName = value;
              });
            },
            decoration: const InputDecoration(
              // label: Text("User name"),
              hintText: "Enter user name",
            ),
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
              borderRadius: BorderRadius.circular(8.0), // Button border radius
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DiceAppNextScreen(
                  name: "$userName",
                ),
              ),
            );
          },
          child: const Text(
            "Second Page",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
