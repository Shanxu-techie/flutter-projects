import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasbeeh_app/counter_provider.dart';
import 'package:vibration/vibration.dart';
// import 'package:vibration/vibration_presets.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  // int counter = 0;
  final AudioPlayer _audioPlayer = AudioPlayer();

  // static const String _counterKey = 'counter_value';
  Future<void> _playBeep(String soundFile) async {
    final prefs = await SharedPreferences.getInstance();
    bool isSoundEnabled = prefs.getBool("isSound") ?? false;
    if (isSoundEnabled) {
      await _audioPlayer.play(AssetSource('audio/$soundFile'));
    }
  }

  Future<void> _vibrate() async {
    final prefs = await SharedPreferences.getInstance();
    bool isVibrationEnabled = prefs.getBool("isVibration") ?? false;
    if (isVibrationEnabled && await Vibration.hasVibrator()) {
      Vibration.vibrate();
      // Vibration.vibrate(preset: VibrationPreset.heartbeatVibration);
    }
  }

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide(
                      width: 20,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(80),
                ),
                // color: Colors.amber,
                child: Center(
                  child: FittedBox(
                    child: Text(
                      "${counterProvider.counter}",
                      style: TextStyle(fontSize: 80),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 48,
                child: FilledButton.tonal(
                  onPressed: () {
                    if (counterProvider.counter > 0) {
                      _playBeep('minus_btn.mp3');
                      _vibrate();
                      // HapticFeedback.lightImpact();
                      counterProvider.decrement();
                    }
                  },
                  style: FilledButton.styleFrom(
                    // minimumSize: Size(double.infinity,48),
                    // fixedSize: Size.fromHeight(50,50),
                    // minimumSize: Size(50, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Icon(Icons.remove),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: FilledButton(
                    //only one text or icon
                    onPressed: () {
                      _playBeep('plus_btn.mp3');
                      _vibrate();
                      // HapticFeedback.lightImpact();
                      //setstate function only in stateful widget
                      // setState(() {
                      //   counter++;
                      // });
                      counterProvider.increment();
                    },
                    style: FilledButton.styleFrom(
                      // backgroundColor: Colors.blue,
                      // minimumSize: Size(double.infinity,48),
                      // minimumSize: Size(50, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
          //filledbutton.tonal-lighter color tone,filledbutton.icon-for both text and icon
          // FilledButton.icon(
          //   onPressed: (){
          //
          //   },
          //   icon: Icon(Icons.download),
          //   label: Text("Download Now"),
          // ),
        ],
      ),
    );
  }
}
