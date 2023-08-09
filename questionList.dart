import 'question.dart';

class QuizBrain{
  int _questionIndex = 0;

  final List<Question> _questionList = [
    Question('The first country in the world to use postcards was the United States of America.', false),
    Question('A male canary tends to have a better singing voice than a female canary.', true),
    Question('Dogs have an appendix.', false),
    Question('Mice have more bones than humans.', true),
    Question('The first product with a bar code was chewing gum.', true),
    Question('Machu Picchu is an abandoned Incan citadel located in Chile.', false),
    Question('The star is the most common symbol used in all national flags around the world.', true),
    Question('Black is the most commonly used colour in all national flags around the world.', false),
    Question('The capital of Australia is Sydney.', false),
    Question('In 2019, the Nobel Prize in Mathematics was awarded to two Japanese scientists.', false),
  ];

  String get centerText {
    if (_questionIndex < _questionList.length){
      return _questionList[_questionIndex].questionText;
    } else {
      return 'End \n you have gotten';
    }
  }
  int get questionIndex {
    return _questionIndex;
  }
  int get questionBank {
    return _questionList.length;
  }
  bool get questionAnswers {
    return _questionList[_questionIndex].questionAnswer;
  }
  void nextQuestion (){ 
    if (_questionIndex < _questionList.length);
    _questionIndex += 1;
  }
}

