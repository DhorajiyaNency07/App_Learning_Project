import 'dart:io';

import 'package:demo_project/whatsapp/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageGrid extends StatefulWidget {
  const ImageGrid({super.key});

  @override
  State<ImageGrid> createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  final ImagePicker picker = ImagePicker();
  XFile? image;
  List<String> imagePath = ["assets/images/img_1.jpg"];

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Grid'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WhatsAppHomeScreen(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: imagePath.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.greenAccent,
                // for emulator
                child: Image.file(
                  File(imagePath[index]),
                  fit: BoxFit.cover,
                ),
                // // for chrome
                // child: Image.network(
                //   (imagePath[index]),
                //   fit: BoxFit.cover,
                // ),
              ),
              const SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteImage(index),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        tooltip: 'Pick Image',
        child: const Icon(Icons.add),
      ),
    );
  }

  void saveImages(List<String> imageList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('imageList', imageList);
  }

  void loadImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> imageList = prefs.getStringList('imageList') ?? [];
    setState(() {
      imagePath = imageList;
    });
  }

  pickImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    setState(() {
      imagePath.add(image!.path);
    });
    saveImages(imagePath);
  }

  void deleteImage(int index) {
    setState(() {
      imagePath.removeAt(index);
    });
    saveImages(imagePath);
  }
}
