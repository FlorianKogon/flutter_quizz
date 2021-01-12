import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {

  QuestionPage(String title, String description, String imagePath, bool answer) {
    this.title = title;
    this.description = description;
    this.imagePath = imagePath;
    this.answer = answer;
  }

  String title;
  String description;
  String imagePath;
  bool answer;

  @override
  _QuestionPageState createState() => _QuestionPageState();

}

class _QuestionPageState extends State<QuestionPage> {

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
                  onPressed: () => dialog('test', "OK"),
                  child: Text("Vrai",
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.red,
                  onPressed: () => dialog('test', "OK"),
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

  Future<Null> dialog(String title, String description) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(title,
              textScaleFactor: 1.4,
            ),
            contentPadding: EdgeInsets.all(10.0),
            children: [
              Text(
                description,
                textScaleFactor: 1.2,
              ),
              RaisedButton(
                color: Colors.teal,
                onPressed: () => {
                  Navigator.pop(context)
                },
                child: Text(
                  "Appuyez",
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