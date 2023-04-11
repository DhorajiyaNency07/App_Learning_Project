
import 'package:flutter/material.dart';

// class ByteConverterApp extends StatelessWidget {
//   const ByteConverterApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Byte Converter',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const ByteConverterHomePage(),
//     );
//   }
// }

class ByteConverterHomePage extends StatefulWidget {
  const ByteConverterHomePage({super.key});

  @override
  State<ByteConverterHomePage> createState() => _ByteConverterHomePageState();
}

class _ByteConverterHomePageState extends State<ByteConverterHomePage> {
  String _result = '';
  final TextEditingController _bytesController = TextEditingController();

  void _convertBytes() {
    int bytes = int.parse(_bytesController.text);
    double kilobytes = bytes / 1024;
    double megabytes = kilobytes / 1024;
    double gigabytes = megabytes / 1024;
    double terabytes = gigabytes / 1024;

    setState(() {
      _result = 'Bytes: $bytes\n'
          'Kilobytes: $kilobytes KB\n'
          'Megabytes: $megabytes MB\n'
          'Gigabytes: $gigabytes GB\n'
          'Terabytes: $terabytes TB';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Byte Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _bytesController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Bytes',
              ),
            ),
            ElevatedButton(
              onPressed: _convertBytes,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Conversion Result:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _result,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const ByteConverterApp());
}

