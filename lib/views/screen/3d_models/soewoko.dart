import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class SoewokoScreen extends StatelessWidget {
  const SoewokoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ModelViewer(
        backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
        src: './assets/soewoko.glb',
        alt: 'A 3D model of an astronaut',
        ar: true,
        arModes: ['scene-viewer', 'webxr', 'quick-look'],
      ),
    );
  }
}
