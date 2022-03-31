import 'package:flutter/material.dart';

class Obstacle extends StatelessWidget {
  final double size;
  const Obstacle({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 30,
          color: Colors.green,
          height: size,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
        ),
        Expanded(
          child: Container(
            width: 30,
            color: Colors.green,
          ),
        )
      ],
    );
  }
}
