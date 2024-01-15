import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/view_models/playbakc_config_vm.dart';

import '../../common/widgets/common_config/theme_config.dart';
import '../../constants/breakpoint.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                SwitchListTile.adaptive(
                  title: const Text(
                    'Mute Video',
                  ),
                  subtitle: const Text('Video will be muted by default.'),
                  value: ref.watch(playBackConfigProvider).muted,
                  onChanged: (value) =>
                      ref.read(playBackConfigProvider.notifier).setMuted(value),
                ),
                SwitchListTile.adaptive(
                  title: const Text(
                    'Autoplay',
                  ),
                  subtitle:
                      const Text('Video will start playing automatically.'),
                  value: ref.watch(playBackConfigProvider).autoPlay,
                  onChanged: (value) => ref
                      .read(playBackConfigProvider.notifier)
                      .setAutoplay(value),
                ),
                ValueListenableBuilder(
                  valueListenable: darkModeConfig,
                  builder: (context, value, child) => SwitchListTile.adaptive(
                    title: const Text(
                      'Dark mode',
                    ),
                    subtitle: const Text('Set dark mode as default.'),
                    value: value,
                    onChanged: (value) {
                      darkModeConfig.value = !darkModeConfig.value;
                    },
                  ),
                ),
                SwitchListTile.adaptive(
                  title: const Text(
                    'Enable Notifications',
                  ),
                  subtitle: const Text('Turn on/off the app notification'),
                  value: false,
                  onChanged: (value) {},
                ),
                CheckboxListTile(
                  checkColor: Colors.white,
                  activeColor: Theme.of(context).primaryColor,
                  title: const Text(
                    'Marketing emails',
                  ),
                  value: false,
                  onChanged: (value) {},
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
