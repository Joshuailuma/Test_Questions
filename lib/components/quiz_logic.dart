import 'question.dart';

int score = 1;
int totalScore = score;

class QuizLogic {
  int _questionNumber = 1;
  int i = 1;

  List<Question> _questionBank = [
    Question(
        'You can force a horse to the river but you can\'t force it to drink water',
        true),
    Question('Nigerian lawmakers are the highest paid in the world', true),
    Question('Ghana is the most populous black nation in the world', false),
    Question('In Binary, 1 + 1 = 2', false),
    Question(
        'Eclipse of the Moon occurs when the Moon gets in between the Earth and the Sun',
        false),
    Question('Google\'s Android 11 was released in September 2020', true),
    Question('DNA means Deoxyribonucleic acid', true),
    Question('Money is not a liquid asset', false),
    Question('Black holes are non-existent in the Milky Way galaxy', false),
    Question('iPhone 12 has 120hz display', false),
    Question('Switzerland is the cleanest country in the world', true),
    Question('United States operates a two party political system', true),
    Question('Apollo is the first human to step on the moon', false),
    Question('The most populous country in the world is China', true),
    Question(
        'A plane figure which consist of points equidistant from a fixed point is a rectangle',
        false),
    Question('Beans contain more carbohydrate than protein', true),
    Question(
        'Acquired muscles as a result of training can be passed down to an offspring',
        false),
    Question('Lionel Messi has won the Ballon d\'Or award five times', false),
    Question('Choreography is used in Ballet dance', true),
    Question(
        'Natural colourants can trigger apoptosis in cancerous cells', true),
    Question('You are the most beautiful person in the world 😉', true),
  ];
  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  int getQuestionLength() {
    return _questionBank.length - 1;
  }

  void increaseQuestionNumber() {
    if (i <= 20) {
      i++;
    }
  }

  int getQuestionNumber() {
    return i;
  }

  void getNextQuestion() {
    if (_questionNumber <= _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0 - 1;
    i = 1 - 1;
    score = 1;
  }
}
