import 'dart:io';

import 'package:flutter/material.dart';

class PhotoReady extends StatelessWidget {
  const PhotoReady({super.key, required this.image});
  final File image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: FileImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
