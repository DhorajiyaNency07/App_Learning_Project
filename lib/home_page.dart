import 'package:flutter/material.dart';
import 'pic_image_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Screen",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          " Welcome to Home Screen...",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.indigo,
            backgroundColor: Colors.black26,
            wordSpacing: 3,
            shadows: [
              Shadow(
                color: Colors.cyan,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ImageGrid(),
            ),
          );
        },
        child: const Icon(
          Icons.arrow_forward,
          size: 25,
        ),
      ),
    );
  }
}
