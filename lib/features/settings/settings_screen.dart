import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Seetings'),
        ),
        body: ListWheelScrollView(
          diameterRatio: 1.5,
          itemExtent: 200,
          children: [
            for (var x in [1, 2, 3, 3, 5, 6, 7, 8])
              FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.teal,
                  child: Text(
                    'Pick me',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
          ],
        ));
  }
}
