import 'package:flutter/material.dart';
import 'package:flutter_practice_1/rounded_image.dart';

class BigAlbum extends StatelessWidget {
  const BigAlbum({
    super.key,
    // required 속성 복습은 d251217.dart 파라미터와 생성자
    required this.imageUrl,
    required this.title,
    required this.artist,
  });

  // 아래에 변수 값 적용시켜주기!
  final String imageUrl;
  final String title;
  final String artist;

  @override
  Widget build(BuildContext context) {
    // 동일한 크기로 좌우 만들어주려고. Expanded
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoundedImage(imageUrl: imageUrl),
          Text(
            title,
            //
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            artist,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
