import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationChanged(bool? newValue) {
    if (newValue == null) return;

    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Seetings'),
        ),
        body: ListView(
          children: [
            SwitchListTile.adaptive(
              title: const Text(
                'Enable Notifications',
              ),
              subtitle: const Text('Turn on/off the app notification'),
              value: _notifications,
              onChanged: _onNotificationChanged,
            ),
            CheckboxListTile(
              checkColor: Colors.white,
              activeColor: Theme.of(context).primaryColor,
              title: const Text(
                'Marketing emails',
              ),
              value: _notifications,
              onChanged: _onNotificationChanged,
            ),
            ListTile(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1980),
                  lastDate: DateTime(2030),
                );
                print(date);
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
              },
              title: const Text(
                'What is your birthday?',
              ),
            ),
            ListTile(
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text("Are you sure?"),
                    content: const Text("Pls don't go..."),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text('No'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        isDestructiveAction: true,
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
              title: const Text(
                'Log out(iOS)',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    title: const Text("Are you sure?"),
                    actions: [
                      CupertinoActionSheetAction(
                        child: const Text('Not log out'),
                        onPressed: () => Navigator.of(context).pop(),
                        isDefaultAction: true,
                      ),
                      CupertinoActionSheetAction(
                        child: const Text('Yes pls'),
                        onPressed: () => Navigator.of(context).pop(),
                        isDestructiveAction: true,
                      ),
                    ],
                  ),
                );
              },
              title: const Text(
                'Log out(iOS / Bottom)',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            AboutListTile(child: Text('About this App')),
          ],
        ));
  }
}
