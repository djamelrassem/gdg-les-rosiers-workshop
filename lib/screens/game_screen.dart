import 'package:flappy_bird/game_objects/_g_o.dart';
import 'package:flappy_bird/game_objects/obstacle.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  double birdPosition = 0.0;
  late AnimationController birdController =
      AnimationController(duration: Duration(seconds: 1), vsync: this)
        ..addListener(birdListener)
        ..addStatusListener(birdStatusListener);
  late Animation birdMouvement = Tween<double>(begin: -1.0, end: 1.0).animate(
    CurvedAnimation(parent: birdController, curve: Curves.linear),
  );
  birdListener() {
    birdPosition = birdMouvement.value;
  }

  birdStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      birdController.animateTo(
        1.0,
        duration: Duration(
          milliseconds: (((birdPosition).toInt() + 1) * 800),
        ),
        curve: Curves.easeIn,
      );
    }
  }

  late double sizeObstacle;
  late AnimationController obstacleControler =
      AnimationController(vsync: this, duration: Duration(milliseconds: 5000))
        ..addStatusListener(obstacleStatusListener)
        ..addListener(obstacleListener);
  late Animation obstacleMouvement =
      Tween<double>(begin: 1.0, end: -1.0).animate(
    CurvedAnimation(parent: obstacleControler, curve: Curves.linear),
  );
  bool incerement = true;
  obstacleListener() {
    if (obstacleMouvement.value > -0.1 && obstacleMouvement.value < 0.1) {
      bool upperBoundCollision =
          ((birdPosition + 1) / 2) * MediaQuery.of(context).size.height <
              sizeObstacle;

      bool lowerBoundCollision =
          ((birdPosition + 1) / 2) * MediaQuery.of(context).size.height >
              (sizeObstacle + MediaQuery.of(context).size.height / 4);

      if (upperBoundCollision || lowerBoundCollision) {
        obstacleControler.stop();
      }
    }
    if (obstacleMouvement.value < -0.2 && incerement) {
      setState(() {
        counter++;
      });
      incerement = false;
    }
  }

  obstacleStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      incerement = true;
      obstacleControler.reset();
      obstacleControler.forward();
    }
  }

  int counter = 0;
  @override
  void initState() {
    obstacleControler.forward();
    birdController.forward();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    sizeObstacle = MediaQuery.of(context).size.height / 3;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          birdPosition = birdPosition - 0.2;
          birdController.animateTo(
            (birdPosition + 1) / 2,
            duration: Duration(milliseconds: 300),
          );
        },
        child: Stack(
          children: [
            Container(
              color: Colors.lightBlue[100],
            ),
            Center(
                child: Text(
              '$counter',
              style: TextStyle(fontFamily: 'Arcade', fontSize: 84),
            )),
            AnimatedBuilder(
              animation: obstacleMouvement,
              builder: (context, child) => Align(
                alignment: Alignment(obstacleMouvement.value, 0),
                child: Obstacle(size: sizeObstacle),
              ),
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
