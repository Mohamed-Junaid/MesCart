import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
class ZoomableImageView extends StatelessWidget {
  final String imageUrl; // Replace with your image URL

  ZoomableImageView({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoView(
          imageProvider: NetworkImage(imageUrl), // Load the image from the URL
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered *
              2, // Adjust zoom levels as needed
        ),
      ),
    );
  }
}