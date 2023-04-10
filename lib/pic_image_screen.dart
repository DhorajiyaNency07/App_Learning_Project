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
  List<String> imagePath = [];

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
                padding: const EdgeInsets.only(top: 95),
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





/////___________________________________________________________________________________________
// import 'dart:io';
// import 'package:demo_project/whatsapp/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ImageGrid extends StatefulWidget {
//   const ImageGrid({super.key});
//
//   @override
//   State<ImageGrid> createState() => _ImageGridState();
// }
//
// class _ImageGridState extends State<ImageGrid> {
//   final ImagePicker picker = ImagePicker();
//   XFile? image;
//   List<String> imagePath = [];
//   List<String> selectedImages = [];
//
//   Future<void> pickImage() async {
//     final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         imagePath.add(pickedImage.path);
//       });
//     }
//   }
//
//   void deleteImage(int index) {
//     setState(() {
//       imagePath.removeAt(index);
//       selectedImages.remove(imagePath[index]);
//     });
//   }
//
//   void selectImage(int index) {
//     setState(() {
//       if (selectedImages.contains(imagePath[index])) {
//         selectedImages.remove(imagePath[index]);
//       } else {
//         selectedImages.add(imagePath[index]);
//       }
//     });
//   }
//
//   void deselectImage(int index) {
//     setState(() {
//       selectedImages.remove(imagePath[index]);
//     });
//   }
//
//   void selectAllImages() {
//     setState(() {
//       selectedImages = List.from(imagePath);
//     });
//   }
//
//   void deselectAllImages() {
//     setState(() {
//       selectedImages.clear();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Photo Gallery'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const WhatsAppHomeScreen(),
//                 ),
//               );
//             },
//             icon: const Icon(Icons.arrow_forward),
//           ),
//         ],
//       ),
//       body: GridView.builder(
//         itemCount: imagePath.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           crossAxisSpacing: 4.0,
//           mainAxisSpacing: 10.0,
//         ),
//         itemBuilder: (BuildContext context, int index) {
//           return Stack(
//             children: [
//               Container(
//                 height: 100,
//                 width: 100,
//                 color: Colors.greenAccent,
//                 child: Image.file(
//                   File(imagePath[index]),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               if (selectedImages.contains(imagePath[index]))
//                 Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.black.withOpacity(0.3),
//                   child: const Center(
//                     child: Icon(
//                       Icons.check,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               const SizedBox(
//                 height: 90,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 95),
//                 child: IconButton(
//                   icon: const Icon(Icons.delete, color: Colors.red),
//                   onPressed: () => deleteImage(index),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () => selectImage(index),
//               ),
//             ],
//           );
//         },
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: selectAllImages,
//             tooltip: 'Select All',
//             child: const Icon(Icons.select_all),
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             onPressed: deselectAllImages,
//             tooltip: 'Deselect All',
//             child:  const Icon(Icons.select_all_sharp),
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             onPressed: pickImage,
//             tooltip: 'Pick Image',
//             child: const Icon(Icons.add),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(const MaterialApp(
//     home: ImageGrid(),
//   ));
// }
