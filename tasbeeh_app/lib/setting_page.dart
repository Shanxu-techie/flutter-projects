import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  bool isSoundEnabled = false;
  bool isVibrationEnabled = false;

  late final SharedPreferences prefs;

  void loadSettingsFromPrefs() async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      isSoundEnabled = prefs.getBool("isSound") ?? false;
      isVibrationEnabled = prefs.getBool("isVibrate") ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadSettingsFromPrefs();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          SwitchListTile(
            title: Text("Sound"),
            subtitle: Text("Play sound when counting"),
            value: isSoundEnabled,
            onChanged: (value) {
              setState(() {
                isSoundEnabled = value;
              });
              prefs.setBool("isSound",value);
            },
          ),
          SwitchListTile(
            title: Text("Vibration"),
            subtitle: Text("Vibrate device when counting"),
            value: isVibrationEnabled,
            onChanged: (value) {
              setState(() {
                isVibrationEnabled = value;
              });
              prefs.setBool("isVibrate",value);
            },
          ),
        ],
      ),
    );
  }
}
