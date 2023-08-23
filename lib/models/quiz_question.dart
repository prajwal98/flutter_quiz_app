class QuizQuestion {
  const QuizQuestion(this.text, this.answerText);

  final String text;
  final List<String> answerText;

  List<String> getShuffeldAnswer() {
    final shuffledList = List.of(answerText);
    shuffledList.shuffle();
    return shuffledList;
  }
}
