import 'package:flutter/material.dart';
import '../Home.dart';

class Result extends StatelessWidget {
  const Result(this.holder, this.resultScore, {Key? key}) : super(key: key);

  final Function() holder;
  final int resultScore;

  String get resultPhrase {
    String resultText;
    if (resultScore >= 70) {
      resultText = "You are Awesome !";
    } else if (resultScore >= 40) {
      resultText = "Good Job";
    } else {
      resultText = "Study and try again";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("images/score.jpg"),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Done!',
              style: TextStyle(
                fontSize: 30,
                fontFamily: "Lobster",
                fontWeight: FontWeight.bold,
                color: isSwitched == false ? Colors.black : Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Total Score = $resultScore',
              style: TextStyle(
                fontFamily: "Lobster",
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: isSwitched == false ? Colors.black : Colors.white,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              resultPhrase,
              style: TextStyle(
                fontFamily: "Lobster",
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: isSwitched == false ? Colors.black : Colors.white,
              ),
            ),
            SizedBox(
              height: 400,
            ),
            TextButton(
              onPressed: holder,
              child: const Text(
                'Restart The App',
                style: TextStyle(
                  fontSize: 30,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
