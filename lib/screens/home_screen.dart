import 'package:flappy_bird/game_objects/_g_o.dart';
import 'package:flappy_bird/screens/game_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.lightBlue[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlappyBird(
              size: 98,
            ),
            SizedBox(
              width: width / 2,
              child: FittedBox(
                child: Text(
                  'FLAPPY BIRD',
                  style: TextStyle(
                    fontFamily: 'Arcade',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, _, __) => GameScreen(),
                  ),
                );
              },
              child: SizedBox(
                width: width / 2.5,
                child: FittedBox(
                  child: Text(
                    'Start',
                    style: TextStyle(
                      fontFamily: 'Arcade',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
