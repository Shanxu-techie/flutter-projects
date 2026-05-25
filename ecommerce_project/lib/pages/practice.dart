import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

// Write a complete Form with a GlobalKey<FormState> containing two TextFormFields:
// one for full name (TextInputType.name) and one for phone (TextInputType.phone),
// both with filled: true and validators that check null/empty first then length.
// Add a DropdownButtonFormField for city selection from a list ['Karachi', 'Lahore', 'Islamabad'].
// Finally add a FilledButton that validates the form and shows a SnackBar("Order Placed!") on success.

class _MenuPageState extends State<MenuPage> {
  final formKey = GlobalKey<FormState>();
  List<String> cities = ['Karachi', 'Lahore', 'Islamabad'];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(filled: true, labelText: "Name"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid name";
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              filled: true,
              labelText: "Phone Number",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Phone number can not be empty";
              }
              if (value.length < 11) {
                return "Please enter a valid phone number.";
              }
              return null;
            },
          ),
          DropdownButtonFormField(
            items: cities
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) {},
          ),
          FilledButton(
            child: Text("Submit"),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Order Placed!")));
              }
            },
          ),
        ],
      ),
    );
  }
}

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});
//
//   @override
//   State<MainPage> createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// Q1. Write a CartProvider class with a final private list _cartList of type List<Map<String, dynamic>>.
// Add an addItem method that takes a Map<String, dynamic> item.
// If the item already exists in the list (match by productId), increment its quantity.
// If not, set its quantity to 1 and add it. Call notifyListeners() appropriately.
// Use lastIndexWhere for the existence check.

// class CartProvider extends ChangeNotifier {
//   final List<Map<String, dynamic>> _cartList = [];
//
//   void addItem(Map<String, dynamic> item) {
//     int itemIndex = _cartList.lastIndexWhere(
//       (element) => element['productId'] == item['productId'],
//     );
//     if (itemIndex == -1) {
//       item['quantity'] = 1;
//       _cartList.add(item);
//     } else {
//       var currentQuantity = int.parse(item['quantity'].toString());
//       _cartList[itemIndex]['quantity'] = currentQuantity++;
//     }
//
//     notifyListeners();
//   }
//
//   void decrementQuantity(int index) {
//     int currentQuantity = int.parse(_cartList[index]['quantity'].toString());
//
//     if (currentQuantity > 1) {
//       _cartList[index]['quantity'] = currentQuantity--;
//
//       notifyListeners();
//     } else if (currentQuantity < 1) {
//       deleteItem(index);
//     }
//   }
//
//   void deleteItem(int index) {
//     _cartList.removeAt(index);
//     notifyListeners();
//   }
// }

// Q3. You have a CartProvider (extends ChangeNotifier) in the tree.
// Inside a button's onPressed, call addItem("Burger") on the provider without triggering a rebuild '
// 'on the calling widget. Write only the onPressed code.

// Q4. Write a Supabase query that fetches all rows from a table called Products,
// ordered by price in ascending order. Store the future in a final field inside a State class
// (as we covered — no inline calls). Show the field declaration and the query.

// Q5. Write a Form widget with a GlobalKey<FormState>. Inside it, put one TextFormField for an email address
// (with appropriate keyboard type and a validator that checks for null/empty).
// Add a FilledButton that calls formKey.currentState!.validate()
// when pressed and shows a SnackBar with the message "Submitted!" if validation passes.

// void main() {
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(create: (context) => CartProvider()),
//       ChangeNotifierProvider(create: (context) => UserProvider()),
//     ], child: MaterialApp(home: MyHomePage(),),),);
// }

// Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailPage(productId: productId)));

// class ProductDetailPage extends StatelessWidget {
//   final String productId;
//
//   const ProductDetailPage({super.key, required this.productId});
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(productId);
//   }
// }

// Write a StatefulWidget called ThemeToggle that has a private bool _isDark = false.
// Display a Switch widget and a Text that shows either "Dark Mode" or "Light Mode" depending on _isDark.
// When the switch is toggled, update the state

// 3.Write a FutureBuilder that calls a function Future<String> fetchMessage().
// While loading show a CircularProgressIndicator.
// On error show Text("Something went wrong"). On success show the result in a Text widget

// Create a Scaffold with a Drawer.
// The drawer should contain a DrawerHeader with a Text("My App"), followed by two ListTiles:
// one with Icons.home and title "Home", one with Icons.settings and title "Settings".
// Each ListTile should close the drawer when tapped.

// class Ques extends StatelessWidget {
//   const Ques({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: Column(
//           children: [
//             DrawerHeader(child: Text("My App")),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text("Home"),
//               onTap: () {
//                 // Scaffold.of(context).closeDrawer();
//                 Navigator.of(context).pop();
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text("Settings"),
//               onTap: () {
//                 // Scaffold.of(context).closeDrawer();
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Q5.Create a StatefulWidget called ProductCard that accepts a String title and double price as constructor parameters.
// In the build method, display both inside a Card using a Column. Access them correctly from the State class.

// class ProductCard extends StatefulWidget {
//   final String title;
//   final double price;
//
//   const ProductCard({super.key, required this.title, required this.price});
//
//   @override
//   State<ProductCard> createState() => _ProductCardState();
// }
//
// class _ProductCardState extends State<ProductCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(child: Column(children: [
//       Text(widget.title),
//       Text(widget.price.toString()),
//     ]));
//   }
// }

// class ThemeToggle extends StatefulWidget {
//   const ThemeToggle({super.key});
//
//   @override
//   State<ThemeToggle> createState() => _ThemeToggleState();
// }
//
// class _ThemeToggleState extends State<ThemeToggle> {
//   // bool _isDark = false;
//   Future<String> fetchMessage() async {
//     return "lorem ipsum";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: fetchMessage(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text("Something went wrong"));
//         } else if (snapshot.hasData && snapshot.data != null) {
//           return Center(child: Text(snapshot.data!));
//         } else {
//           return Center(child: Text("No data available"));
//         }
//       },
//     );
//     //   Column(
//     //   children: [
//     //     Switch(
//     //       value: _isDark,
//     //       onChanged: (value) {
//     //         setState(() {
//     //           _isDark = value;
//     //         });
//     //       },
//     //     ),
//     //     Text(_isDark ? "Dark Mode" : "Light Mode"),
//     //   ],
//     // );
//   }
// }

//
// class ThemeToggle extends StatelessWidget {
//   const ThemeToggle({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     bool _isDark = false;
//     return Switch(
//       value: _isDark,
//       onChanged: () {
//         setState(() {_isDark != _isDark;});
//       },
//     );
//   }
// }

//
// // class Practice extends StatelessWidget {
// //   const Practice({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Container(
// //         color: Colors.blue,
// //
// //         padding: EdgeInsets.all(16),
// //
// //         margin: EdgeInsets.all(8),
// //
// //         child: Text(
// //           "lorem ipsum",
// //           style: TextStyle(color: Colors.white, fontSize: 20),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// class CounterWidget extends StatefulWidget {
//   const CounterWidget({super.key});
//
//   @override
//   State<CounterWidget> createState() => _CounterWidgetState();
// }
//
// class _CounterWidgetState extends State<CounterWidget> {
//   // int _count = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     final items = ['Flutter', 'Dart', 'Provider', 'Supabase', 'Firebase'];
//     return ListView.builder(
//       itemCount: items.length,
//
//       itemBuilder: (context, index) {
//         return Card(
//           child: ListTile(
//             title: Text(items[index]),
//
//             trailing: Icon(Icons.arrow_forward_ios),
//           ),
//         );
//       },
//     );
//     //   Center(
//     //   child: Column(
//     //     children: [
//     //       Text("$_count"),
//     //       FilledButton(
//     //         child: Text("Plus"),
//     //         onPressed: () {
//     //           setState(() {
//     //             _count++;
//     //           });
//     //         },
//     //       ),
//     //     ],
//     //   ),
//     // );
//   }
// }
