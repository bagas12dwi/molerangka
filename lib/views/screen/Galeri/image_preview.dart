import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  ImagePreview({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Preview'),
      ),
      body: Center(
        child: Image.network(imagePath),
      ),
    );
  }
}
