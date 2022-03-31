import 'package:flutter/material.dart';

class FlappyBird extends StatelessWidget {
  final double size;
  const FlappyBird({Key? key, this.size = 32}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      width: size,
      height: size,
      image: AssetImage('assets/images/flappy.png'),
    );
  }
}
