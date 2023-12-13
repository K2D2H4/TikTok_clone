import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class FlashModeButton extends StatefulWidget {
  final FlashMode newFlashMode;
  final IconData icon;
  final CameraController cameraController;

  const FlashModeButton(
      {super.key,
      required this.icon,
      required this.newFlashMode,
      required this.cameraController});

  @override
  State<FlashModeButton> createState() => _FlashModeButtonState();
}

class _FlashModeButtonState extends State<FlashModeButton> {
  late CameraController _cameraController = widget.cameraController;
  late FlashMode _flashMode = _cameraController.value.flashMode;

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _setFlashMode(widget.newFlashMode),
      color: _flashMode == widget.newFlashMode ? Colors.amber : Colors.white,
      icon: Icon(
        widget.icon,
      ),
    );
  }
}
