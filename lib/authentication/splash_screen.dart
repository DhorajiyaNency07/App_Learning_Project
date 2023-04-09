import 'package:demo_project/game_app/tic_tac_toe_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_home_screen.dart';
import 'auth_log_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? sharedPreferences;

  @override
  void initState() {
    super.initState();
    getInstanceData();
  }

  Future<void> getInstanceData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash Screen"),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const TicTacToeHomePage(),
        //         ),
        //       );
        //     },
        //     icon: const Icon(Icons.navigate_next),
        //   ),
        // ],
      ),
      body: sharedPreferences == null
          ? const CircularProgressIndicator() // Show loading indicator while waiting for shared preferences
          : FutureBuilder<bool>(
        future: Future.value(sharedPreferences!.containsKey('loginData')),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData && snapshot.data!) {
            // User is already logged in, navigate to the home screen
            return const AuthHomeScreen();
          } else {
            // User is not logged in, navigate to the login screen
            return const AuthLoginScreen();
          }
        },
      ),
    );
  }
}

