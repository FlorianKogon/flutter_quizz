import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {

  QuestionPage(String title, String description, String imagePath, String answer) {
    this.title = title;
    this.description = description;
    this.imagePath = imagePath;
    this.answer = answer;
  }

  String title;
  String description;
  String imagePath;
  String answer;

  @override
  _QuestionPageState createState() => _QuestionPageState();

}

class _QuestionPageState extends State<QuestionPage> {

  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.description,
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
              child: Image.asset(widget.imagePath,
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
                    widget.answer == "false" ? dialog('Mauvaise réponse', "images/faux.jpg") : dialog('Bonne réponse', 'images/vrai.jpg'),
                    widget.answer == "true" ? score++ : score = score
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
                    widget.answer == "true" ? dialog('Mauvaise réponse', "images/faux.jpg") : dialog('Bonne réponse', 'images/vrai.jpg'),
                    widget.answer == "false" ? score++ : score = score
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
                  Navigator.pop(context)
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
}