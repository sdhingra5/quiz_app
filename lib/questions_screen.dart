import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = question[0];
    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin:const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.question,
              style: TextStyle(
                color: Colors.white, 
                fontSize: 28
                ),
                textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.answers.map((item){
            return AnswerButton(answerText: item,
            onTap:(){});
           }),
          ],),
      ),
    );
  }
}
