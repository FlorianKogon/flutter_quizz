import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'question_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(widget.title, color: Colors.white),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 10.0,
              child: Image.asset('images/cover.jpg',
                width: MediaQuery
                    .of(context)
                    .size
                    .height / 2,
              ),
            ),
            Container(
              height: 50.0,
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: toQuizzQuestion,
              child: CustomText("Commencez le quizz", color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  void toQuizzQuestion() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
          return QuestionPage();
        }));
  }
}