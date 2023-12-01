import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/inbox/activity_screen.dart';

import 'constants/sizes.dart';

void main() {
  runApp(const TikTok());
}

class TikTok extends StatelessWidget {
  const TikTok({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFFE9435A),
            selectionColor: Color(0xFFE9435A),
          ),
          /*        splashColor: Colors.transparent,
          highlightColor: Colors.transparent,*/
          primaryColor: const Color(0xFFE9435A),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
            ),
          )),
      home: const ActivityScreen(),
    );
  }
}
