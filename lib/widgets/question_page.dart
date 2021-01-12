import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'package:flutter_quizz/models/question.dart';

class QuestionPage extends StatefulWidget {

  @override
  _QuestionPageState createState() => _QuestionPageState();

}

class _QuestionPageState extends State<QuestionPage> {

  Question question;

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

  int index = 0;
  int score = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    question = listOfQuestions[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(question.title, color: Colors.white,),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(question.description,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 50.0,
            ),
            Card(
              elevation: 10.0,
              child: Image.asset(question.imagePath,
                width: MediaQuery.of(context).size.height / 2,
              ),
            ),
            Container(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  color: Colors.green,
                  onPressed: () => {
                    question.answer == "false" ? dialog('Mauvaise réponse', "images/faux.jpg") : dialog('Bonne réponse', 'images/vrai.jpg'),
                    question.answer == "true" ? score++ : score = score
                  },
                  child: Text("Vrai",
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.red,
                  onPressed: () => {
                    question.answer == "true" ? dialog('Mauvaise réponse', "images/faux.jpg") : dialog('Bonne réponse', 'images/vrai.jpg'),
                    question.answer == "false" ? score++ : score = score
                  },
                  child: Text("Faux",
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> dialog(String title, String imagePath) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(title,
              textScaleFactor: 1.4,
              textAlign: TextAlign.center,
            ),
            contentPadding: EdgeInsets.all(10.0),
            children: [
              Text("Score : $score / 9",
                textAlign: TextAlign.center,
              ),
              Container(
                height: 20.0,
              ),
              Image.asset(imagePath),
              Container(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.teal,
                onPressed: () => {
                  Navigator.pop(context),
                  nextQuestion()
                },
                child: Text(
                  "Continuez",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          );
        }
    );
  }

  Future<Null> alert() async {
    return showDialog(context: context,
    barrierDismissible: false,
    builder: (BuildContext buildContext) {
      return AlertDialog(
        title: CustomText("C'est fini", color: Colors.white, factor: 2.0,
        ),
        contentPadding: EdgeInsets.all(10.0),
        content: CustomText("Votre score est de $score"),
        actions: [
          FlatButton(onPressed: () => {
            Navigator.pop(buildContext),
            Navigator.pop(context)
          },
              child: CustomText('OK', factor: 1.2, color: Colors.blue,))
        ],
      );
    });
  }

  void nextQuestion() {
    if (index < listOfQuestions.length - 1) {
      index++;
      setState(() {
        question = listOfQuestions[index];
      });
    } else {
      alert();
    }
  }
}