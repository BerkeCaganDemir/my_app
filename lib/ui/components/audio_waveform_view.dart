import 'package:flutter/material.dart';
import 'waveform_controller.dart';

class AudioWaveformView extends StatelessWidget {
  final WaveformController controller;

  const AudioWaveformView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return LinearProgressIndicator(
          value: controller.progress / 100000, // normalize
          backgroundColor: Colors.white12,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
        );
      },
    );
  }
}
