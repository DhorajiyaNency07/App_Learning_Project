import 'package:flutter/material.dart';
import '../tweet_generator/make_quotes_like_tweet.dart';
import 'chat_screen.dart';

class WhatsAppHomeScreen extends StatefulWidget {
  const WhatsAppHomeScreen({Key? key}) : super(key: key);

  @override
  State<WhatsAppHomeScreen> createState() => _WhatsAppHomeScreenState();
}

class _WhatsAppHomeScreenState extends State<WhatsAppHomeScreen> {
  Map userData = {
    "user": [
      {
        "title": "A",
        "subtitle": "1",
        "image": "assets/images/img_3.jpg",
        "icon": Icons.more_vert,
      },
      {
        "title": "B",
        "subtitle": "2",
        "image": "assets/images/img_2.jpg",
        "icon": Icons.more_vert,
      },
      {
        "title": "C",
        "subtitle": "3",
        "image": "assets/images/img_1.jpg",
        "icon": Icons.more_vert,
      },
      {
        "title": "D",
        "subtitle": "4",
        "image": "assets/images/img_4.jpg",
        "icon": Icons.more_vert,
      },
      {
        "title": "E",
        "subtitle": "5",
        "image": "assets/images/img_5.jpg",
        "icon": Icons.more_vert,
      },
      {
        "title": "F",
        "subtitle": "1",
        "image": "assets/images/img_3.jpg",
        "icon": Icons.more_vert,
      },
      {
        "title": "G",
        "subtitle": "2",
        "image": "assets/images/img_2.jpg",
        "icon": Icons.more_vert,
      },
      {
        "title": "H",
        "subtitle": "3",
        "image": "assets/images/img_1.jpg",
        "icon": Icons.more_vert,
      },
      {
        "title": "I",
        "subtitle": "4",
        "image": "assets/images/img_4.jpg",
        "icon": Icons.more_vert,
      },
      {
        "title": "J",
        "subtitle": "5",
        "image": "assets/images/img_5.jpg",
        "icon": Icons.more_vert,
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp UI'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuotesAppScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage("${userData["user"][index]["image"]}"),
                  ),
                  title: Text("${userData["user"][index]["title"]}"),
                  subtitle: const Text('Hello!'),
                  trailing: Text("${userData["user"][index]["subtitle"]}"),
                  // Icon(userData["user"][index]["icon"]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailScreen(
                          username: 'User ${index + 1}',
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const Center(child: Text('Status')),
            const Center(child: Text('Calls')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.chat),
        ),
      ),
    );
  }
}
