import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List <Map<String,Object>> summaryData;
 
  @override
  //TODO: implement build
  Widget build(context){
    return Column(
      children: summaryData.map(
        (data){
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: data['user_answer'] == data['correct_answer'] 
                  ? const Color.fromARGB(255, 102, 255, 178) 
                  : const Color.fromARGB(255, 255, 120, 120),
                  shape: BoxShape.circle,
              ),
              child: Text(
                ((data['question_index'] as int) +1).toString(),
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
          
              const SizedBox(width: 20,),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),  
                 
                    const SizedBox(height: 8),


                    Text(
                      'Your answer: ${data['user_answer']}',
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 255, 120, 120),
                        fontSize: 16,
                      ),    
                    ),
                  const SizedBox(height: 4),
                  
                    Text(
                      'Correct answer: ${data['correct_answer']}',
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 102, 255, 178),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )
            
          
          ],
          ),      

        );
      },
      ).toList(),

    );
  }
  
  

}