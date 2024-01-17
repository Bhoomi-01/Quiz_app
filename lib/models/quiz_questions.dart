class QuizQuestions {
  // Not a widget - just a regular object(based on a class)
  const QuizQuestions(
      this.question, this.answers); //constructor function to reuse the class

  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
