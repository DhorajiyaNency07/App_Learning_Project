import 'dart:math';
import 'package:flutter/material.dart';
import '../bank_transaction/bank_transaction_screen.dart';

class MonthlyEmiCalculator extends StatefulWidget {
  const MonthlyEmiCalculator({super.key});

  @override
  State<MonthlyEmiCalculator> createState() => _MonthlyEmiCalculatorState();
}

class _MonthlyEmiCalculatorState extends State<MonthlyEmiCalculator> {
  double principalAmount = 0.0;
  double interestRate = 0.0;
  int loanTerm = 0;
  double monthlyEmi = 0.0;
  double showTotalAmountPayable = 0.0;
  double showInterestAmount = 0.0;

  void _calculateEmi() {
    if (principalAmount == 0.0 || interestRate == 0.0 || loanTerm == 0) {
      setState(() {
        monthlyEmi = 0.0;
        showTotalAmountPayable = 0.0;
        showInterestAmount = 0.0;
      });
      return;
    }

    double monthlyInterestRate = interestRate / 1200;
    int loanTermInMonths = loanTerm * 12;
    double emi = (principalAmount * monthlyInterestRate) /
        (1 - (pow(1 / (1 + monthlyInterestRate), loanTermInMonths)));
    double totalAmountPayable = emi * loanTermInMonths;
    double interestAmount = totalAmountPayable - principalAmount;

    setState(() {
      monthlyEmi = emi;
      showTotalAmountPayable = totalAmountPayable;
      showInterestAmount = interestAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMI Calculator'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BankLoginScreen(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Enter Principal Amount',
                ),
                onChanged: (value) {
                  setState(() {
                    principalAmount = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Enter Interest Rate',
                ),
                onChanged: (value) {
                  setState(() {
                    interestRate = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Loan Term (in years)',
                ),
                onChanged: (value) {
                  setState(() {
                    loanTerm = int.tryParse(value) ?? 0;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _calculateEmi,
                child: const Text('Calculate EMI'),
              ),
              const SizedBox(height: 16.0),
              RichText(
                text: TextSpan(
                  text: "Monthly EMI: ",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                  children: [
                    TextSpan(
                      text: "₹${monthlyEmi.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              RichText(
                text: TextSpan(
                  text: "Total Amount Payable: ",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                  children: [
                    TextSpan(
                      text: "₹${showTotalAmountPayable.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              RichText(
                text: TextSpan(
                  text: "Interest Amount: ",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                  children: [
                    TextSpan(
                      text: "₹${showInterestAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
