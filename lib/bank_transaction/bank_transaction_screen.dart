import 'package:demo_project/game_app/tic_tac_toe_app_screen.dart';
import 'package:flutter/material.dart';
import 'bank_home_screen.dart';

// Define a Map to store the account numbers and passwords
Map<String, String> accountCredentials = {
  '123456': 'password123',
  '789012': 'password456',
  '345678': 'password789',
  '1234567': 'nency'
};

// Define a variable to store the account balance
double accountBalance = 50000.00;

// Define a constant for the minimum balance requirement
const double minimumBalance = 10000.00;

// Create a login screen widget
class BankLoginScreen extends StatelessWidget {
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  BankLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bank Login Screen"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TicTacToeHomePage(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to Bank...",
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1.2,
                    color: Colors.green,
                    shadows: [
                      Shadow(
                        color: Colors.green.shade900,
                        offset: const Offset(1, 1),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: accountNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Account Number',
                ),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Enter Password',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  String accountNumber = accountNumberController.text;
                  String password = passwordController.text;

                  if (accountCredentials.containsKey(accountNumber) &&
                      accountCredentials[accountNumber] == password) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BankHomeScreen()),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Login Failed'),
                          content:
                              const Text('Invalid account number or password.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
