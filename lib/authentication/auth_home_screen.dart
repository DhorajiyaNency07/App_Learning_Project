import 'dart:convert';
import 'dart:io';
import 'package:demo_project/authentication/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHomeScreen extends StatefulWidget {
  const AuthHomeScreen({Key? key}) : super(key: key);

  @override
  State<AuthHomeScreen> createState() => _AuthHomeScreenState();
}

class _AuthHomeScreenState extends State<AuthHomeScreen> {
  String email = "";
  String password = "";
  String image = "";
  SharedPreferences? sharedPreferences;

  @override
  void initState() {
    // TODO: implement initState
    getInstanceData();
    super.initState();
  }

  getInstanceData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    getData();
  }

  getData() {
    if (sharedPreferences!.containsKey('loginData')) {
      dynamic data = jsonDecode(sharedPreferences!.getString('loginData')!);

      email = data["email"];
      password = data["password"];
      image = data["image"];
    } else {
      debugPrint('false');
    }
    setState(() {});
  }

  Future<void> logout(BuildContext context) async {
    // Logout logic goes here
    // Save logout status in shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('loggedIn', false);
    // Navigate to the login screen
    // Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SplashScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: FileImage(
                          File(image),
                        ),
                        fit: BoxFit.cover),
                    // for chrome
                    // image: NetworkImage(image), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  height: 40,
                  width: 15,
                  color: Colors.transparent,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email: $email",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Pass: $password",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => logout(context),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> dataStore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('loggedIn') ?? false;
  }
}
