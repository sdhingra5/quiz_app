import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;
  @override

  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer){
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {

    final currentQuestion = question[currentQuestionIndex];
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
              style: GoogleFonts.lato(
                color: Colors.white, 
                fontSize: 24,
                fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getshuffledAnswers().map((item){
            return AnswerButton(answerText: item,
            onTap:(){
              answerQuestion(item);
            });
            
            
           }),
          ],),
      ),
    );
  }
}
