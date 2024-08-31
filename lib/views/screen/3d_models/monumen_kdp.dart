import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:flutter/material.dart';

class MonumenKdp extends StatelessWidget {
  const MonumenKdp({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ModelViewer(
        backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
        src: './assets/monumen_kdp.glb',
        alt: 'A 3D model of an astronaut',
        ar: true,
        arModes: ['scene-viewer', 'webxr', 'quick-look'],
      ),
    );
  }
}
