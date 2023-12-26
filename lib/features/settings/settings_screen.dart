import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/breakpoint.dart';

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
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Settings'),
        ),
        body: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth:
                  width > Breakpoints.md ? Breakpoints.md : Breakpoints.sm,
            ),
            child: ListView(
              children: [
                /*    SwitchListTile.adaptive(
                  title: const Text(
                    'Auto mute videos',
                  ),
                  subtitle: const Text('Videos will be muted by default.'),
                  value: VideoConfig.of(context).autoMute,
                  onChanged: (value) {},
                ),*/
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
                            onPressed: () => Navigator.of(context).pop(),
                            isDefaultAction: true,
                            child: const Text('Not log out'),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () => Navigator.of(context).pop(),
                            isDestructiveAction: true,
                            child: const Text('Yes pls'),
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
                const AboutListTile(child: Text('About this App')),
              ],
            ),
          ),
        ));
  }
}
