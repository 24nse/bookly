import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const  CustomBookImage({super.key, required this.imageUrl});
  final String imageUrl;

  bool _isValidUrl(String url) {
    if (url.isEmpty) return false;
    final trimmed = url.trim();
    return (trimmed.startsWith('http://') || trimmed.startsWith('https://')) && !trimmed.contains(' ');
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6/4,
        child: _isValidUrl(imageUrl)
            ? CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: imageUrl,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              )
            : Image.asset(
                'assets/images/Logo.png',
                fit: BoxFit.fill,
              ),
      ),
    );
  }
}   

