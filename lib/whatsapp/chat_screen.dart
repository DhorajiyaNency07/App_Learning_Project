import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  final String username;

  const UserDetailScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
      ),
      body: Center(
        child: Text('User details for $username'),
      ),
    );
  }
}
