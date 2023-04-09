// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class MXPlayer extends StatefulWidget {
//   const MXPlayer({super.key});
//
//   @override
//   State<MXPlayer> createState() => _MXPlayerState();
// }
//
// class _MXPlayerState extends State<MXPlayer> {
//   final VideoPlayerController _controller =
//       VideoPlayerController.asset('assets/sample_video.mp4');
//
//   @override
//   void initState() {
//     super.initState();
//     _controller.initialize();
//     _controller.setLooping(true);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('Mx Player'),
//         // actions: [
//         //   IconButton(
//         //     onPressed: () {
//         //       Navigator.push(
//         //         context,
//         //         MaterialPageRoute(
//         //           builder: (context) => const (),
//         //         ),
//         //       );
//         //     },
//         //     icon: const Icon(Icons.navigate_next),
//         //   ),
//         // ],
//       ),
//       body: Container(
//         height: 300,
//         width: 500,
//         color: Colors.green,
//         child: Stack(
//           children: [
//             AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: VideoPlayer(_controller),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 height: 80,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Colors.transparent,
//                       Colors.black.withOpacity(0.8),
//                     ],
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.replay_10),
//                           onPressed: () {},
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.skip_previous),
//                           onPressed: () {},
//                         ),
//                         IconButton(
//                           icon: Icon(_controller.value.isPlaying
//                               ? Icons.pause
//                               : Icons.play_arrow),
//                           onPressed: () {
//                             setState(() {
//                               if (_controller.value.isPlaying) {
//                                 _controller.pause();
//                               } else {
//                                 _controller.play();
//                               }
//                             });
//                           },
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.skip_next),
//                           onPressed: () {},
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.forward_10),
//                           onPressed: () {},
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '00:00',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                             ),
//                           ),
//                           Text(
//                             '12:34',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
