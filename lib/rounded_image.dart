import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // 셀렉트 위젯 해서 AspectRatio
      borderRadius: BorderRadius.circular(20), // 숫자는 반지름 값이다.
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }
}
