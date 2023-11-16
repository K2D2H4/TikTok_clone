import 'package:flutter/material.dart';

import 'features/authentication/sign_up_screen.dart';

void main() {
  runApp(const TikTok());
}

class TikTok extends StatelessWidget {
  const TikTok({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: const Color(0xFFE9435A)),
      home: SignUpScreen(),
    );
  }
}
