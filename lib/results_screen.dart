import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({
    super.key, 
    required this.chosenAnswers,
    required this.onRestart,  
    });

final List<String> chosenAnswers;
final void Function() onRestart;

 List<Map<String, Object>> getSummaryData() {
  List<Map<String, Object>> summary = [];
  for (var i = 0; i < chosenAnswers.length; i++) {
    summary.add({
      'question_index': i,
      'question': question[i].question,
      'correct_answer': question[i].answers[0],
      'user_answer': chosenAnswers[i],
    });
  }
  return summary;
 }


  @override
  Widget build(context)
  {
    final summaryData = getSummaryData();
    final numTotalQuestions = getSummaryData().length;
    final numTotalCorrect = summaryData.where(
      (data) {
        return data['user_answer'] == data['correct_answer'];
      },
    ).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
             Text('You answered $numTotalCorrect out of $numTotalQuestions questions Correctly',
             textAlign: TextAlign.center,
             style: GoogleFonts.lato(
              color: Color.fromARGB(255, 230, 200, 255), 
              fontSize: 24, 
              fontWeight: FontWeight.bold, 
              ),
             ),

            const SizedBox(height:30),

              SizedBox(
            height: 400,
            child: SingleChildScrollView(
              child: QuestionSummary(
                summaryData: summaryData),
            ),
              ),


            const SizedBox(height:30,),
            TextButton(
              onPressed: onRestart,
              child: Text(
                'Restart Quiz',
                style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}