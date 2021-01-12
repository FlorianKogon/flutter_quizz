import 'package:flutter/material.dart';
import 'question_page.dart';
import 'question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizz Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Quizz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Question> listOfQuestions = [
    Question("Belgique ?", "Ce drapeau est-il celui de la Belgique ?", "images/belgique.jpg", "true"),
    Question("Realité ?", "Cette photo a-t-elle été réalisée en studio ?", "images/eagle.jpg", "false"),
    Question("Lune ?", "Etes-vous bien sur la Lune ?", "images/lune.jpg", "true"),
    Question("Clavier ?", "Est-ce la photo du dernier clavier Logitech ?", "images/commodore.jpg", "false"),
    Question("Tintin ?", "Le chien de Tintin s'appelle-t-il Milou ?", "images/tintin.jpg", "true" ),
    Question("Russie ?", "Cela est-il le Kremlin ?", "images/russie.jpg", "true"),
    Question("Nyctalope ?", "Cet animal est-il nyctalope ?", "images/nyctalope.jpg", "true"),
    Question("Pirate ?", "Ce drapeau est-il celui des pirate ?", "images/pirate.png", "true"),
    Question("Pharaon ?", "Les pharaons sont-ils des êtres imaginaires ?", "images/pharaon.jpg", "false"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 10.0,
              child: Image.asset('images/cover.jpg',
                width: MediaQuery.of(context).size.height / 2,
              ),
            ),
            Container(
              height: 50.0,
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: toQuizzQuestion,
              child: Text("Commencez le quizz",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toQuizzQuestion() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
          return QuestionPage(listOfQuestions[0].title,
              listOfQuestions[0].description,
              listOfQuestions[0].imagePath,
              listOfQuestions[0].answer
          );
        }));
  }
}
