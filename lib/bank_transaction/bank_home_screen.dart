// Create a home screen widget
import 'package:flutter/material.dart';

import 'bank_transaction_screen.dart';

class BankHomeScreen extends StatefulWidget {
  const BankHomeScreen({super.key});

  @override
  State<BankHomeScreen> createState() => _BankHomeScreenState();
}

class _BankHomeScreenState extends State<BankHomeScreen> {
  final TextEditingController depositController = TextEditingController();
  final TextEditingController withdrawController = TextEditingController();

  double currentBalance = accountBalance;

  void _deposit() {
    double amount = double.tryParse(depositController.text) ?? 0.0;
    setState(() {
      currentBalance += amount;
      depositController.text = '';
    });
  }

  void _withdraw() {
    double amount = double.tryParse(withdrawController.text) ?? 0.0;
    if (amount > currentBalance) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Withdrawal Failed'),
            content: const Text('Insufficient funds.'),
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
    } else if (currentBalance - amount < minimumBalance) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Withdrawal Failed'),
            content: const Text('Minimum balance requirement not met.'),
            actions: [
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
    } else {
      setState(() {
        currentBalance -= amount;
        withdrawController.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banking App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Account Balance',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    '\$${currentBalance.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 30.0),
                  ),
                ],
              ),
              const SizedBox(height: 12.00),
              const Divider(
                thickness: 2,
                color: Colors.black,
                endIndent: 15,
                indent: 15,
              ),
              const SizedBox(height: 12.00),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100.0,
                    child: TextFormField(
                      controller: depositController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Deposit',
                      ),
                    ),
                  ),
                  // const SizedBox(width: 16.0),
                  MaterialButton(
                    color: Colors.green,
                    shape: const OutlineInputBorder(),
                    onPressed: _deposit,
                    child: const Text('Deposit'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100.0,
                    child: TextFormField(
                      controller: withdrawController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Withdraw',
                      ),
                    ),
                  ),
                  // const SizedBox(width: 16.0),
                  MaterialButton(
                    color: Colors.deepPurpleAccent,
                    shape: const OutlineInputBorder(),
                    onPressed: _withdraw,
                    child: const Text('Withdraw'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/////Tic Tac Toe Game in C
///please help me to create Tic Tac Toe Game in flutter
///https://github.com/DhorajiyaNency07?tab=repositories
///https://www.sanfoundry.com/c-program-tic-tac-toe-game/
///https://www.sanfoundry.com/
