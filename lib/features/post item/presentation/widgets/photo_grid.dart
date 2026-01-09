import 'dart:io';

import 'package:flutter/material.dart';

class PhotoGrid extends StatelessWidget {
  const PhotoGrid({
    super.key,
    required this.networkImages,
    required this.localImages,
    required this.onRemove,
  });

  final List<String> networkImages;
  final List<File> localImages;
  final void Function(int index) onRemove;

  @override
  Widget build(BuildContext context) {
    final total = networkImages.length + localImages.length;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: total,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final Widget image;

        if (index < networkImages.length) {
          image = Image.network(
            networkImages[index],
            fit: BoxFit.cover,
          );
        } else {
          image = Image.file(
            localImages[index - networkImages.length],
            fit: BoxFit.cover,
          );
        }

        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox.expand(child: image),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: () => onRemove(index),
                child: const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.close, size: 14, color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
