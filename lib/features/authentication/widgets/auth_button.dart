import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;

  const AuthButton({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      // 부모 위젯의 사이즈에 영향을 받음
      widthFactor: 1, //100퍼센트
      child: Container(
        padding: EdgeInsets.all(Sizes.size14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200, width: Sizes.size1),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              child: icon,
              alignment: Alignment.centerLeft,
            ),
            Text(text,
                style: TextStyle(
                    fontSize: Sizes.size16, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
