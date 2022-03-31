import 'package:flappy_bird/game_objects/_g_o.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  late AnimationController birdController =
      AnimationController(duration: Duration(seconds: 1), vsync: this);
  late Animation birdMouvement = Tween<double>(begin: -1.0, end: 1.0).animate(
    CurvedAnimation(parent: birdController, curve: Curves.linear),
  );

  @override
  void initState() {
    birdController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              color: Colors.lightBlue[100],
            ),
            AnimatedBuilder(
              animation: birdMouvement,
              builder: (context, child) => Align(
                alignment: Alignment(0, birdMouvement.value),
                child: FlappyBird(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
