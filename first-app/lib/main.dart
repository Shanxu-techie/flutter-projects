import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;
import 'package:share_plus/share_plus.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //named parameters of material app
      title: 'Meri App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _globalKey = GlobalKey();

  final String phoneNumber = "+92 300 1234567";
  final String email = "daniellasmith@gmail.com";

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      debugPrint('Could not launch email app');
    }
  }

  Future<void> _launchDialer() async {
    final Uri telUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(telUri)) {
      await launchUrl(telUri);
    } else {
      debugPrint('Could not launch dialer for $phoneNumber');
    }
  }

  Future<void> _launchSocialMedia(String appUrl, String webUrl) async {
    final Uri appUri = Uri.parse(appUrl);
    final Uri webUri = Uri.parse(webUrl);

    if (await canLaunchUrl(appUri)) {
      await launchUrl(appUri, mode: LaunchMode.externalApplication);
    } else {
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _shareText() async {
    await SharePlus.instance.share(
      ShareParams(
        text:
            '👤 Daniella Smith | Flutter Developer\n'
            '📞 $phoneNumber\n'
            '📧 $email\n'
            '💼 https://www.linkedin.com/in/shanza-r-821185361/\n'
            '🐙 https://github.com/Shanxu-techie',
        subject: 'Daniella Smith - Flutter Developer',
      ),
    );
  }

  Future<void> _shareVCard() async {
    final String vCard =
        'BEGIN:VCARD\n'
        'VERSION:3.0\n'
        'FN:Daniella Smith\n'
        'TITLE:Flutter Developer\n'
        'TEL:$phoneNumber\n'
        'EMAIL:$email\n'
        'URL:https://www.linkedin.com/in/shanza-r-821185361/\n'
        'URL:https://github.com/Shanxu-techie\n'
        'END:VCARD';

    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/daniella_smith.vcf');
    await file.writeAsString(vCard);

    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(file.path)],
        text: 'Save Daniella Smith as a contact',
      ),
    );
  }

  Future<void> _shareAsImage() async {
    try {
      RenderRepaintBoundary boundary =
          _globalKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary;

      final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      final ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      final Uint8List bytes = byteData!.buffer.asUint8List();

      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/profile_card.png');
      await file.writeAsBytes(bytes);

      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(file.path)],
          text: 'Daniella Smith - Flutter Developer',
        ),
      );
    } catch (e) {
      debugPrint('Could not share as image: $e');
    }
  }

  void _showShareOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Share via',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.text_fields, color: Colors.teal),
              title: Text('Share as Text'),
              onTap: () {
                Navigator.pop(context);
                _shareText();
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_page, color: Colors.blue),
              title: Text('Share as Contact (.vcf)'),
              onTap: () {
                Navigator.pop(context);
                _shareVCard();
              },
            ),
            ListTile(
              leading: Icon(Icons.image, color: Colors.purple),
              title: Text('Share as Image'),
              onTap: () {
                Navigator.pop(context);
                _shareAsImage();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //return Text("Hello World");
    //snackBar
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text("Meri App"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        //centerTitle: true,
      ),
      drawer: Drawer(),
      body: RepaintBoundary(
        key: _globalKey,
        child: Container(
          //Press ALT+Enter or bulb icon to get wrap shortcut
          padding: EdgeInsets.all(24),
          //padding: EdgeInsets.only(top:20, left:10,..),
          //padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          width: double.infinity,
          child: Column(
            //by default column screen ki height leta ha screen ki puri width nhi leta
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            //to center horizontally we need to increase the width of the container
            children: [
              // Container(
              //     width: 100,
              //     height: 100,
              //     color: Colors.red,
              //   ),
              // Container(
              //   width: 100,
              //   height: 100,
              //   color: Colors.yellow,
              // ),
              // Container(
              //   width: 100,
              //   height: 100,
              //   color: Colors.green,
              // ),
              // Text(
              //   "Hello World",
              //   style: TextStyle(
              //     //shade 500 is the normal as is w500 and 14 font size
              //     color: Colors.red.shade900,
              //     fontSize: 28,
              //     fontWeight: FontWeight.bold,
              //     fontStyle: FontStyle.italic,
              //     //fontFamily assignment
              //     // decoration: TextDecoration.lineThrough,
              //     decoration: TextDecoration.underline,
              //     decorationColor: Colors.amber.shade900,
              //     //decoration style
              //     //backgroundColor: Colors.limeAccent,
              //     backgroundColor: Colors.black26,//black ka aga .shade nhi hota usi ka aga number likhna hota ha
              //   ),
              // ),
              //to add images go to pubspec.yaml and under assets comments add assets
              CircleAvatar(
                radius: 80,
                foregroundImage: AssetImage("assets/images/profile_pic_1.jpg"),
              ),
              SizedBox(height: 10),
              Text(
                "Daniella Smith",
                style: TextStyle(fontSize: 32, color: Colors.teal.shade100),
              ),
              SizedBox(height: 4),
              Text(
                "FLUTTER DEVELOPER",
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 6,
                  color: Colors.teal.shade100,
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: 150,
                child: Divider(thickness: 0.5, color: Colors.white),
              ),
              SizedBox(height: 16),
              Card(
                //phone number ko dialer main pohancha do when clicked on phone
                child: ListTile(
                  // leading,title,trailing
                  onTap: () => _launchDialer(),
                  leading: Icon(Icons.phone, color: Colors.teal.shade700),
                  title: Text(phoneNumber),
                  trailing: IconButton(
                    icon: Icon(Icons.copy, color: Colors.teal),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: phoneNumber));
                    },
                  ),
                  // trailing assignment
                ),
              ),
              SizedBox(height: 8),
              Card(
                //linkedin,instagram,further social media cards - weblinks, when clicked that particular app or webpage opens
                //when clicked on email,email app opens
                child: ListTile(
                  onTap: () => _launchEmail(),
                  // leading,title,trailing
                  leading: Icon(Icons.email, color: Colors.teal.shade700),
                  title: Text(email),
                  // trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  // trailing assignment
                ),
              ),
              Card(
                child: ListTile(
                  // leading,title,trailing
                  onTap: () => _launchSocialMedia(
                    'linkedin://in/shanza-r-821185361/',
                    'https://www.linkedin.com/in/shanza-r-821185361/',
                  ),
                  leading: FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: Colors.teal.shade700,
                  ),
                  title: Text('linkedin.com/in/shanza-r-821185361/'),
                  // subtitle: Text('linkedin.com/in/shanza-r-821185361/',style: TextStyle(color: Colors.black),),
                  // onLongPress: (){debugPrint("Long Pressed");},
                  // enabled: false,
                  // dense: true,
                  // tileColor: Colors.teal.shade50,
                  // selected: true,
                  // selectedColor: Colors.teal,
                  // trailing assignment
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () => launchUrl(
                    Uri.parse('https://github.com/Shanxu-techie'),
                    mode: LaunchMode.externalApplication,
                  ),
                  leading: FaIcon(
                    FontAwesomeIcons.github,
                    color: Colors.teal.shade700,
                  ),
                  title: Text('github.com/Shanxu-techie'),
                ),
              ),
              //ClipRRect is a widget image can be wrapped in it to get the image rounded
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(75),//50% of width ya height to make it exactly circle
              //   child: Image.asset(
              //       "assets/images/profile_pic_1.jpeg",
              //     width: 150,
              //     height: 150,
              //     //fit: BoxFit.cover,
              //   ),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.teal,
        onPressed: () => _showShareOptions(context),
        // onPressed: () {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Row(
        //         children: const [
        //           Padding(
        //             padding: EdgeInsets.only(right: 8),
        //             child: Icon(
        //               Icons.notifications,
        //               color: Colors.teal,
        //               size: 18,
        //             ),
        //           ),
        //           Text(
        //             "Button Pressed",
        //             style: TextStyle(
        //               fontWeight: FontWeight.bold,
        //               color: Colors.teal,
        //             ),
        //           ),
        //         ],
        //       ),
        //       backgroundColor: Colors.white,
        //       behavior: SnackBarBehavior.floating,
        //       elevation: 6,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(8),
        //       ),
        //       margin: const EdgeInsets.fromLTRB(100, 0, 16, 16),
        //       duration: Duration(seconds: 2),
        //     ),
        //   );
        //   //print("Button Pressed");
        // },
        child: Icon(Icons.share),
      ),
    );
  }
}

// class Address {
//   String country;
//   String city;
//
//   Address({
//     required this.city,
//     required this.country
//   });
// }
//
// class Person {
//   String name;
//   int age;
//   Address address;
//
//   Person({
//     required this.name,
//     required this.age,
//     required this.address
//   });
// }
//
// void main() {
//   Person p1 = Person(
//       name: "Ahsan",
//       age: 20,
//       address: Address(
//           city: "Lahore",
//           country: "Pakistan"
//       )
//   );
// }

// void main() {
//   print('Hello World');
//   //both single and double quotes can be used for strings
//   int age = 20;
//   double weight = 72.5;
//   String name = "Bob";
//   String city = 'Lahore';
//   print(age);
//
//   //String interpolation
//   print("$name is $age years old and lives in $city");
//
//   int price = 200;
//   print("Rs. $price");
//
//   bool isActive = true;
//   isActive = false;
//
//   //compile time constants
//   //constants
//   const double gravity = 9.8;
//   //const gravity = 9.8;//type is being inferred
//   //run time constants
//   final double height;
//   height = 5.7;
//   //constant should be initialized at the time of definition
//   //final can be assigned value later not necessary to assign value at definition but value can only be assigned once
//
//   //type inference
//   var quantity = 10;
//   //quantity = "Multan"; //gives error as type int was already inferred
//
//   //variable to multiple datatypes of data like int,string,...
//   dynamic storage = 5;
//   storage = 'Hello';
//
//   //null safety - ?,??,!
//   //int p;
//   //print(p);
//   //int q = p + 5;
//   //if a variable is null and is being used in the code, the code cn not be compiled as it is unsafe
//   //A compile time error appears
//
//   int? p; //nullable variable
//   /*if(p != null){
//     int q = p + 5;
//   }*/
//   //Agar hum condition nhi lagana chahta, ! can be used with variable and dart ignores null safety aur agar phir bhi null hua to crash ho jayga
//   //int q = p! + 5;
//
//   //int q = p!;
//   //if we are assigning nullable variable value to not nullable variable, use ! or ??
//   int q = p ?? 0;
//   print(q);
//
//   int marks = 60;
//
//   if (marks >= 80) {
//     print("A");
//   } else if (marks >= 60) {
//     print("B");
//   } else {
//     print("Fail");
//   }
//
//   for (int i = 0; i < 5; i++) {
//     print(i);
//   }
//
//   //List<String> colors = [];//empty list
//   List<String> colors = ['Red', 'Black'];
//   colors.add("White");
//   colors.add("Green");
//   colors.add("Blue");
//
//   colors.removeAt(0);
//   colors.remove("Green");
//
//   print('Size of list is ${colors.length}');
//   print(colors[0]);
//
//   colors.clear(); //delete all elements in the list
//
//   colors.insert(
//     0,
//     "Brown",
//   ); //value isn't replaced or updated just other values are pushed forward
//   colors[0] = "Yellow"; //value is replaced or updated
//
//   if (colors.isEmpty) {}
//   colors.indexOf("Black");
//
//   sum(5, 9);
//   subtract(3, 8);
//   multiply(5, 8);
//
//   print(getSalePrice(price: 200, discount: 10));
//   //in case of named parameters all parameters become optional and can be given in any order
//   //getSalePrice(discount: 40); - wil give error
//   getSalePrice(price: 500);
//
//   Person p1 = Person(age: 20, name: "Bob");
// }
//
// //Functions
// int sum(int a, int b) {
//   return a + b;
// }
//
// //arrow functions
// int multiply(int a, int b) => a * b;
//
// var subtract = (int a, int b) => a - b;
//
// //anonymous functions
// //(int a , int b) => a - b;
// /* (int a , int b){
//   return a + b;
// } */
//
// //positional parameters
// //order,readability,compulsory requirements problems
// /*int getSalePrice(int price, int discount){
//   return price - discount;
// }*/
// //named parameters
// //default value can be given to the named parameters
// /*int getSalePrice({int price = 0, int discount = 0}){
//   return price - discount;
// }*/
// //by default all named parameters are optional,some can be made required
// /*int getSalePrice({required int price, int discount = 0}){
//   return price - discount;
// }*/
// //make the variables nullable
// /*int getSalePrice({int ?price, int ?discount}){
//   if(price != null && discount != null){
//     return price - discount;
//   } else if(price != null){
//     return price;
//   } else {
//     return 0;
//   }
// }*/
//
// int getSalePrice({required int? price, int? discount}) {
//   if (price != null && discount != null) {
//     return price - discount;
//   } else {
//     return 0;
//   }
//
//   /*if(discount == null){
//     discount = 0;
//   }*/
//
//   //discount = discount ?? 0;
// }
//
// //classes
// class Person {
//   //variables can be made nullable or initialized to default value or parameterized construction can be made
//   /*int age = 0;
//   String name = "";*/
//
//   int age;
//   String name;
//
//   //int _age; //_ means private
//
//   //Parameterized constructor
//   //positional parameters
//   Person({this.age = 0, required this.name});
// }
//
// //inheritance
// //class Person extends Human
// //person is child class,human is parent class
