import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

import 'constants/sizes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  /* SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );*/

  runApp(const TikTok());
}

class TikTok extends StatelessWidget {
  const TikTok({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: const MainNavigationScreen(),
    );
  }
}

class LayoutBuilderCodeLab extends StatelessWidget {
  const LayoutBuilderCodeLab({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.teal,
        child: Center(
          child: Text(
            '${size.width}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 100,
            ),
          ),
        ),
      ),
    );
  }
}
