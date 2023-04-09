import 'package:demo_project/simple_to_do_app/to_do_home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class PasswordGenerator extends StatefulWidget {
  const PasswordGenerator({Key? key}) : super(key: key);

  @override
  State<PasswordGenerator> createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  final TextEditingController lengthController = TextEditingController();
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Password Generator Using Random Func'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ToDoHomePage(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Password Length:',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: lengthController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
              decoration: const InputDecoration(
                  hintText: 'Enter length here...',
                  hintStyle: TextStyle(fontSize: 15)),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 16), // T
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Button border radius
                ),
              ),
              onPressed: () {
                setState(() {
                  password = generatePassword(int.parse(lengthController.text));
                });
              },
              child: const Text('Generate Password'),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                const Text(
                  'Generated Password: ',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    password,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            // SelectableText(
            //   password,
            //   style: const TextStyle(fontSize: 20.0),
            // ),
          ],
        ),
      ),
    );
  }

  String generatePassword(int length) {
    const String lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
    const String uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String numbers = '0123456789';
    const String specialChars = '@#\$%^&*()_=+<>?';
    // const String specialChars = '!@#\$%^&*()-_=+[{]}\\|;:\'",<.>/?';

    String allChars = lowercaseChars + uppercaseChars + numbers + specialChars;

    Random random = Random();
    String password = '';

    for (int i = 0; i < length; i++) {
      int randomIndex = random.nextInt(allChars.length);
      password += allChars[randomIndex];
    }

    return password;
  }
}
