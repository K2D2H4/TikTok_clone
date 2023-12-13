import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class FlashModeButton extends StatefulWidget {
  final FlashMode flashMode;
  final FlashMode newFlashMode;
  final IconData icon;

  const FlashModeButton(
      {super.key,
      required this.flashMode,
      required this.icon,
      required this.newFlashMode});

  @override
  State<FlashModeButton> createState() => _FlashModeButtonState();
}

class _FlashModeButtonState extends State<FlashModeButton> {
  late CameraController _cameraController;
  late FlashMode _flashMode = widget.flashMode;

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _setFlashMode(widget.newFlashMode),
      color: _flashMode == widget.flashMode ? Colors.amber : Colors.white,
      icon: Icon(
        widget.icon,
      ),
    );
  }
}
