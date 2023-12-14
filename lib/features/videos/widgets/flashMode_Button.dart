import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class FlashModeButton extends StatelessWidget {
  const FlashModeButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.flashMode,
    this.toggleMode,
  });

  final IconData icon;
  final void Function()? onPressed;
  final FlashMode? flashMode;
  final FlashMode? toggleMode;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: flashMode == toggleMode ? Colors.amber : Colors.white,
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
