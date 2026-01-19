import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ChatImageViewer extends StatefulWidget {
  const ChatImageViewer({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  final List<String> images;
  final int initialIndex;

  @override
  State<ChatImageViewer> createState() => _ChatImageViewerState();
}

class _ChatImageViewerState extends State<ChatImageViewer> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: PhotoViewGallery.builder(
        pageController: _controller,
        itemCount: widget.images.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(widget.images[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 3,
          );
        },
        loadingBuilder: (_, __) => const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
