/// extra screen



// // import 'package:flutter/cupertino.dart';
// //
// // class IosUiLearning extends StatefulWidget {
// //   const IosUiLearning({Key? key}) : super(key: key);
// //
// //   @override
// //   State<IosUiLearning> createState() => _IosUiLearningState();
// // }
// //
// // class _IosUiLearningState extends State<IosUiLearning> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return const CupertinoPageScaffold(
// //       child: CupertinoApp(
// //         color: CupertinoColors.activeGreen,
// //       ),
// //     );
// //   }
// // }
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'authentication/auth_home_screen.dart';
//
// class AuthLoginScreenNew extends StatefulWidget {
//   const AuthLoginScreenNew({Key? key}) : super(key: key);
//
//   @override
//   State<AuthLoginScreenNew> createState() => _AuthLoginScreenNewState();
// }
//
// class _AuthLoginScreenNewState extends State<AuthLoginScreenNew> {
//   SharedPreferences? sharedPreferences;
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final ImagePicker picker = ImagePicker();
//   XFile? image;
//   final _formKey = GlobalKey<FormState>();
//   var isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     getInstanceData();
//   }
//
//   Future<void> getInstanceData() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//     setState(() {});
//   }
//
//   setData() async {
//     await sharedPreferences!.setString(
//       'loginData',
//       jsonEncode({
//         "email": emailController.text,
//         "password": passwordController.text,
//         "image": image!.path,
//       }),
//     );
//   }
//
//   submit() {
//     final isValid = _formKey.currentState?.validate();
//     if (!isValid!) {
//       return;
//     }
//     _formKey.currentState?.save();
//     setData();
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const AuthHomeScreen(),
//       ),
//       (route) => false,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Login')),
//       body: Column(
//         children: [
//           Center(
//             child: sharedPreferences == null
//                 ? const CircularProgressIndicator() // Show loading indicator while waiting for shared preferences
//                 : FutureBuilder<bool>(
//                     future: Future.value(
//                         sharedPreferences!.containsKey('loginData')),
//                     builder:
//                         (BuildContext context, AsyncSnapshot<bool> snapshot) {
//                       if (snapshot.hasData && snapshot.data!) {
//                         // User is already logged in, navigate to the home screen
//                         return const AuthHomeScreen();
//                       } else {
//                         // User is not logged in, show login form
//                         return const Text('Login form goes here');
//                       }
//                     },
//                   ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   InkWell(
//                     onTap: () async {
//                       // image = await picker.pickImage(source: ImageSource.camera,);
//                       image = await picker.pickImage(
//                         source: ImageSource.gallery,
//                       );
//                       setState(() {});
//                     },
//                     child: Container(
//                       height: 150,
//                       width: 150,
//                       decoration: const BoxDecoration(
//                         color: Colors.blue,
//                         shape: BoxShape.circle,
//                       ),
//                       child: image == null
//                           ? const Icon(
//                               Icons.account_box_sharp,
//                               size: 30,
//                               color: Colors.white,
//                             )
//                           : ClipOval(
//                               child: Image.network(image!.path),
//
//                               // Image.file(
//                               //   File(image!.path),
//                               //   fit: BoxFit.cover,
//                               // ),
//                             ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.width * 0.05,
//                   ),
//                   TextFormField(
//                     controller: emailController,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                             color: Colors.black,
//                           ),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         labelText: 'E-Mail'),
//                     keyboardType: TextInputType.emailAddress,
//                     onFieldSubmitted: (value) {
//                       //Validator
//                     },
//                     validator: (value) {
//                       if (value!.isEmpty ||
//                           !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                               .hasMatch(value)) {
//                         return 'Enter a valid email!';
//                       }
//                       return null;
//                     },
//                   ),
//                   //box styling
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   //text input
//                   TextFormField(
//                     controller: passwordController,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                             color: Colors.black,
//                           ),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         labelText: 'Password'),
//                     keyboardType: TextInputType.emailAddress,
//                     onFieldSubmitted: (value) {},
//                     obscureText: true,
//                     validator: (value) {
//                       if (value!.isEmpty ||
//                           !RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#$&*~]).{8,}$")
//                               .hasMatch(value)) {
//                         return 'Enter a valid Password!';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       shape: const BeveledRectangleBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(15),
//                         ),
//                       ),
//                     ),
//                     child: const Text(
//                       "Submit",
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         letterSpacing: 0.8,
//                       ),
//                     ),
//                     onPressed: () {
//                       submit();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
