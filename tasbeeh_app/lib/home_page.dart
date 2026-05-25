import 'package:flutter/material.dart';
import 'package:tasbeeh_app/setting_page.dart';
import 'package:tasbeeh_app/zikr_list_page.dart';
import 'package:tasbeeh_app/counter_page.dart';
import 'package:tasbeeh_app/counter_provider.dart';
import 'package:provider/provider.dart';

//StatelessWidget is the parent class
//child class is a subtype of parent class
//is relationship
// class Car extends Vehicle{
//
// }
//
// class Student extends Human{
//
// }

//current values of the properties of an object
//state can change

//in stateless widget the state can not change once it is build
//in stateful widget the state can change, can be updated, can be modified

//add row functionality on the buttons - has fixed space and + has remaining space
//jub + par click ho ya - par a beep sound should play also a haptic feedback(vibration)
//+ par different sound - par diff sound
//3rd party vibration package - pub.dev
//audio files then assets then pubspec then play
//bottom navigation's add kar sakta hain

//har dafa app start hona par 0 na ho bulka usi state main ho
//persistent storage main save karayn
//phir usi storage sa load karayn
//shared preferences
//uninstall sa shared prefernces remove hojati ha ya data clear karna par

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> pagesList = [
    //provider
    CounterPage(),
    ZikrListPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Tasbeeh counter"),
        actions: [
          IconButton(
            onPressed: () {
              // _updateCounter(0);
              // setState(() {
              //   counter=0;
              // });
              Provider.of<CounterProvider>(context,listen: false).reset();
            },
            icon: Icon(Icons.refresh),
          ),
          // IconButton(onPressed: (){}, icon:Icon(Icons.settings)),
        ],
      ),
      drawer: Drawer(),
      //expanded widget ko jitni jaga milti ha wo utni leta ha- baqi apni jaga le lein phir baqi jo jaga bacha gi wo sari iski
      body: pagesList[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        //always show by default
        // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        // backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        // indicatorColor: Theme.of(context).colorScheme.primaryFixedDim,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.add), label: "Counter"),
          NavigationDestination(icon: Icon(Icons.person), label: 'Zikr List'),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
