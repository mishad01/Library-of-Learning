class quizzQuestions {
  const quizzQuestions(this.qestionsQuizz, this.answerOption);
  final String qestionsQuizz;
  final List<String> answerOption;

  List<String> getshuffledAnswer() {
    final shuffledList = List.of(answerOption);
    shuffledList.shuffle();
    return shuffledList;
  }
}
