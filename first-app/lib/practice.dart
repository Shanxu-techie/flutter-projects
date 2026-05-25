
// import "package:flutter/material.dart";
// import "package:url_launcher/url_launcher.dart";
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(title: "My App", home: HomePage());
//   }
// }
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   Future<void> _launchEmail() async {
//     String email = "abc@gmail.com";
//     Uri emailUri = Uri(scheme: "mailto", path: email);
//     if (await canLaunchUrl(emailUri)) {
//       await launchUrl(emailUri);
//     } else {
//       debugPrint("Could not launch Url");
//     }
//   }
//
//   Future<void> _launchDialer() async {
//     String tel = "+92 123 4567890";
//     Uri telUri = Uri(scheme: "tel", path: tel);
//     if (await canLaunchUrl(telUri)) {
//       await launchUrl(telUri);
//     } else {
//       debugPrint("Could not open dialer");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Column(
//             children: [
//               IconButton(
//                 icon: Icon(Icons.share),
//                 onPressed: () {
//                   showModalBottomSheet(
//                     context: context,
//                     builder: (context) {
//                       return Container(
//                         child: Column(
//                           children: [
//                             ListTile(
//                               title: Text("Share Text"),
//                               onTap: () {
//                                 Navigator.pop(context);
//                                 // _shareText();
//                               },
//                             ),
//                             ListTile(
//                               title: Text("Share File"),
//                               onTap: () {
//                                 Navigator.pop(context);
//                                 // _shareFile();
//                               },
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//
//
//
//
//     ],
//           ),
//         ),
//       ),
//     );
//   }
// }
