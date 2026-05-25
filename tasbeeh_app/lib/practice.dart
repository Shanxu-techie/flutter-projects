// Question 10
// Topic: Custom Widget
// Write a custom StatelessWidget called WeatherCard with:
//
// String city
// double temperature
// IconData icon
//
// Displays in a Card:
//
// Icon(icon) at top
// Text(city) in middle
// Text("${temperature}°C") at bottom
//
// All in a Column with mainAxisAlignment: MainAxisAlignment.center.

import "package:flutter/material.dart";

class WeatherCard extends StatelessWidget {
  final String city;
  final double temperature;
  final IconData icon;

  const WeatherCard({
    super.key,
    required this.city,
    required this.temperature,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon), Text(city), Text("${temperature}°C")],
      ),
    );
  }
}

// Question 3 — Hard
// Write a complete screen called ZikrPage as a StatefulWidget that:
//
// Has a List<String> called zikrList with 3 default items: "Alhamdulillah", "SubhanAllah", "Allahu Akbar"
// Displays the list using ListView.builder inside a Card with each item as a ListTile with title
// Has a TextEditingController called zikrController
// Has a TextField at the bottom with labelText: "Add Zikr" and a suffix IconButton with Icons.add
// Pressing the add button: if field is not empty → adds to list via setState → clears the field
// Properly disposes the controller

// import "package:flutter/material.dart";
//
// class ZikrPage extends StatefulWidget {
//   const ZikrPage({super.key});
//
//   @override
//   State<ZikrPage> createState() => _ZikrPageState();
// }
//
// class _ZikrPageState extends State<ZikrPage> {
//   List<String> zikrList = ["Alhamdulillah", "SubhanAllah", "Allahu Akbar"];
//   var zikrController = TextEditingController();
//
//   @override
//   void dispose() {
//     zikrController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: zikrList.length,
//               itemBuilder: (context, index) {
//                 return Card(child: ListTile(title: Text(zikrList[index])));
//               },
//             ),
//           ),
//           SizedBox(height: 12),
//           TextField(
//             controller: zikrController,
//             decoration: InputDecoration(
//               labelText: "Add Zikr",
//               suffixIcon: IconButton(
//                 onPressed: () {
//                   var zikrText = zikrController.text.trim();
//                   if (zikrText.isNotEmpty) {
//                     setState(() {
//                       zikrList.add(zikrText);
//                     });
//                     zikrController.clear();
//                   }
//                 },
//                 icon: Icon(Icons.add),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Write a complete StatefulWidget page called ColorSwitcherPage that:
//
// Has a List<Color> with 3 colors: Colors.red, Colors.green, Colors.blue
// Has an int selectedIndex = 0
// Shows a Container of size 200x200 filled with the currently selected color
// Has a Row of 3 ElevatedButtons labeled "Red", "Green", "Blue"
// Pressing each button updates the container color via setState

// import 'package:flutter/material.dart';
//
// class ColorSwitcherPage extends StatefulWidget {
//   const ColorSwitcherPage({super.key});
//
//   @override
//   State<ColorSwitcherPage> createState() => _ColorSwitcherPageState();
// }
//
// class _ColorSwitcherPageState extends State<ColorSwitcherPage> {
//   List<Color> colors = [Colors.red, Colors.green, Colors.blue];
//   int selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(width: 200, height: 200, color: colors[selectedIndex]),
//             SizedBox(height: 24),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   child: Text("Red"),
//                   onPressed:(){
//                     setState((){
//                       selectedIndex = 0;
//                     });
//                   },
//                 ),
//                 ElevatedButton(
//                   child: Text("Green"),
//                   onPressed:(){
//                     setState((){
//                       selectedIndex = 1;
//                     });
//                   },
//                 ),
//                 ElevatedButton(
//                   child: Text("Blue"),
//                   onPressed:(){
//                     setState((){
//                       selectedIndex = 2;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
