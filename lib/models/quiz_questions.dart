class QuizQuestion {
  const QuizQuestion(this.numb, this.text, this.answer);

  final String numb;
  final String text;
  final List<String> answer;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}
