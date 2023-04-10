// // import 'dart:io';
// //
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// //
// // class MakeQuoteLikeTweet {
// //   final String? text;
// //   final String? userId;
// //   final String? userName;
// //
// //   MakeQuoteLikeTweet({this.text, this.userId, this.userName});
// // }
// //
// // class QuotesAppScreen extends StatefulWidget {
// //   const QuotesAppScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   State<QuotesAppScreen> createState() => _QuotesAppScreenState();
// // }
// //
// // class _QuotesAppScreenState extends State<QuotesAppScreen> {
// //   final List<MakeQuoteLikeTweet> quotes = [];
// //   final ImagePicker picker = ImagePicker();
// //   XFile? image;
// //   XFile? profileImage;
// //
// //   final _formKey = GlobalKey<FormState>();
// //   final textController = TextEditingController();
// //   final userIdController = TextEditingController();
// //   final userNameController = TextEditingController();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       resizeToAvoidBottomInset: false,
// //       appBar: AppBar(
// //         title: const Text('Create Quotes As Tweet'),
// //         actions: [
// //           IconButton(
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) => const PasswordGenerator(),
// //                 ),
// //               );
// //             },
// //             icon: const Icon(Icons.arrow_forward),
// //           ),
// //         ],
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(15.0),
// //         child: Column(
// //           children: [
// //             InkWell(
// //               onTap: () async {
// //                 image = await picker.pickImage(source: ImageSource.gallery);
// //                 setState(() {});
// //               },
// //               child: Container(
// //                 height: 350,
// //                 width: 400,
// //                 color: Colors.deepPurpleAccent[100],
// //                 child: Stack(
// //                   children: [
// //                     Container(
// //                       height: 500,
// //                       width: 500,
// //                       color: Colors.transparent,
// //                       child: image == null
// //                           ? const Icon(Icons.add_a_photo)
// //                           : Opacity(
// //                               opacity: 0.92,
// //                               child: Image.file(
// //                                 File(image!.path),
// //                                 fit: BoxFit.cover,
// //                               ),
// //                             ),
// //                     ),
// //                     ListView.separated(
// //                       physics: const NeverScrollableScrollPhysics(),
// //                       shrinkWrap: true,
// //                       itemCount: quotes.length,
// //                       separatorBuilder: (context, index) {
// //                         return const Divider(thickness: 1, height: 1);
// //                       },
// //                       itemBuilder: (context, index) {
// //                         final quote = quotes[index];
// //                         return Padding(
// //                           padding: const EdgeInsets.only(
// //                               top: 70, left: 30, right: 30),
// //                           child: Container(
// //                             decoration: BoxDecoration(
// //                               color: Colors.white12,
// //                               borderRadius: const BorderRadius.all(
// //                                 Radius.circular(10),
// //                               ),
// //                               border: Border.all(
// //                                 color: Colors.white,
// //                                 width: 1,
// //                               ),
// //                             ),
// //                             child: Column(
// //                               children: [
// //                                 ListTile(
// //                                   leading: InkWell(
// //                                     onTap: () async {
// //                                       profileImage = await picker.pickImage(
// //                                           source: ImageSource.gallery);
// //                                       setState(() {});
// //                                     },
// //                                     child: profileImage == null
// //                                         ? const Icon(Icons.add_a_photo)
// //                                         : Container(
// //                                             height: 40,
// //                                             width: 40,
// //                                             decoration: const BoxDecoration(
// //                                               color: Colors.greenAccent,
// //                                               shape: BoxShape.circle,
// //                                             ),
// //                                             child: ClipOval(
// //                                               child: Image.file(
// //                                                 File(profileImage!.path),
// //                                                 fit: BoxFit.cover,
// //                                               ),
// //                                             ),
// //                                           ),
// //                                   ),
// //                                   title: Text(
// //                                     '${quote.userName}',
// //                                     style: TextStyle(
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                   subtitle: Text(
// //                                     '@${quote.userId}',
// //                                     style: TextStyle(
// //                                       fontStyle: FontStyle.italic,
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 Padding(
// //                                   padding: const EdgeInsets.symmetric(
// //                                     horizontal: 10,
// //                                     vertical: 5,
// //                                   ),
// //                                   child: Text(
// //                                     '${quote.text}',
// //                                     style: TextStyle(
// //                                       fontSize: 18,
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 SizedBox(height: 10),
// //                                 Row(
// //                                   mainAxisAlignment:
// //                                       MainAxisAlignment.spaceEvenly,
// //                                   children: [
// //                                     IconButton(
// //                                       onPressed: () {
// //                                         // Add logic for liking a quote
// //                                       },
// //                                       icon: Icon(
// //                                         Icons.favorite_border,
// //                                       ),
// //                                     ),
// //                                     IconButton(
// //                                       onPressed: () {
// //                                         // Add logic for retweeting a quote
// //                                       },
// //                                       icon: Icon(
// //                                         Icons.repeat,
// //                                       ),
// //                                     ),
// //                                     IconButton(
// //                                       onPressed: () {
// //                                         // Add logic for sharing a quote
// //                                       },
// //                                       icon: Icon(
// //                                         Icons.share,
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 10),
// //             Form(
// //               key: _formKey,
// //               child: Column(
// //                 children: [
// //                   TextFormField(
// //                     controller: textController,
// //                     decoration: InputDecoration(
// //                       labelText: 'Quote Text',
// //                     ),
// //                     validator: (value) {
// //                       if (value == null || value.isEmpty) {
// //                         return 'Please enter a quote';
// //                       }
// //                       return null;
// //                     },
// //                   ),
// //                   TextFormField(
// //                     controller: userIdController,
// //                     decoration: InputDecoration(
// //                       labelText: 'User ID',
// //                     ),
// //                     validator: (value) {
// //                       if (value == null || value.isEmpty) {
// //                         return 'Please enter a user ID';
// //                       }
// //                       return null;
// //                     },
// //                   ),
// //                   TextFormField(
// //                     controller: userNameController,
// //                     decoration: InputDecoration(
// //                       labelText: 'User Name',
// //                     ),
// //                     validator: (value) {
// //                       if (value == null || value.isEmpty) {
// //                         return 'Please enter a user name';
// //                       }
// //                       return null;
// //                     },
// //                   ),
// //                   ElevatedButton(
// //                     onPressed: () {
// //                       if (_formKey.currentState!.validate()) {
// //                         final newQuote = MakeQuoteLikeTweet(
// //                           text: textController.text,
// //                           userId: userIdController.text,
// //                           userName: userNameController.text,
// //                         );
// //                         quotes.add(newQuote);
// //                         textController.clear();
// //                         userIdController.clear();
// //                         userNameController.clear();
// //                         setState(() {});
// //                       }
// //                     },
// //                     child: Text('Add Quote'),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'dart:io';
// import 'package:demo_project/whatsapp/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
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
//                   child: Center(
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
//             child:  Icon(Icons.select_all_sharp),
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
