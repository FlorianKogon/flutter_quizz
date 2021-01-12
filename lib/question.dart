class Question {
  String title;
  String description;
  String imagePath;
  bool answer;

  Question(String title, String description, String imagePath, bool answer) {
    this.title = title;
    this.description = description;
    this.imagePath = imagePath;
    this.answer = answer;
  }
}