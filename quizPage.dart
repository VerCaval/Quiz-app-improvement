import 'package:flutter/material.dart';
import 'questionList.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<bool> scoreKeeper = [];

  QuizBrain quizBrain = QuizBrain();
  late String centerTextDisplay = quizBrain.centerText;
  late int questionIndexCurrent = quizBrain.questionIndex;
  late int questionBankLength = quizBrain.questionBank;
  late bool questionTruth = quizBrain.questionAnswers;

  void nextQuestion (){
    if (questionIndexCurrent < questionBankLength);
    questionIndexCurrent += 1;
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    centerTextDisplay,
                    textAlign: TextAlign.center,
                    style:
                      const TextStyle(fontSize: 25, color: Colors.white)),
                ),
              ),
           ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  )
                ),
                onPressed: (){
                  if (questionIndexCurrent < questionBankLength) {
                    bool correctAnswer = questionTruth;
                    if (correctAnswer == true) {
                      scoreKeeper.add(true);
                    } else {
                      scoreKeeper.add(false);
                    }
                  }
                  setState(() {
                    nextQuestion();
                  });
                },
                child: const Text('True'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: Colors.red,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  )
                ),
                onPressed: (){
                  if (questionIndexCurrent < questionBankLength) {
                    bool correctAnswer = questionTruth;
                    if (correctAnswer == false) {
                      scoreKeeper.add(true);
                    } else {
                      scoreKeeper.add(false);
                    }
                  }
                  setState(() {
                    nextQuestion();
                  });
                },
                child: const Text('False'),
              ),
            ),
          ),
          Row(children: [
            for (var response in scoreKeeper) response == true
            ? const Icon(Icons.check, color: Colors.green,)
            : const Icon(Icons.close, color: Colors.red,)
          ],)
        ]);
  }
}
