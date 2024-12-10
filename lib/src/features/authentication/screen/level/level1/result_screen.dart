import 'package:flutter/material.dart';
import 'package:minilaw/src/common_widgets/infoPopup.dart';
import 'package:minilaw/src/constants/colors.dart';
import 'package:minilaw/src/constants/img_strings.dart';
import 'package:minilaw/src/features/authentication/screen/level/level1/popup.dart';
import 'onlineSafetyQ.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.score,
  }) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpurple,
      body: GestureDetector(
        onTap: () {
          bool isCompleted = score == 3;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LevelCompletedPopup(
              completed: isCompleted,
              )),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 1000),
            const Text(
              'Your Score: ',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w500,
                color: kWhiteColor
              ),
            ),
            Image(image: AssetImage(kRocket)),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: score / 3,
                    color: Colors.green,
                    backgroundColor: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      score.toString(),
                      style: const TextStyle(fontSize: 80,color: kWhiteColor),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${(score / questions.length * 100).round()}%',
                      style: const TextStyle(fontSize: 25,color: kWhiteColor),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
