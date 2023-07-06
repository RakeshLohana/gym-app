import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gym_app/workoutScreen/WorkoutScreen.dart';

class SurveyDialog extends StatefulWidget {
  @override
  _SurveyDialogState createState() => _SurveyDialogState();
}

class _SurveyDialogState extends State<SurveyDialog> {
  final List questions = [
    'What is your primary fitness goal? ',
    'Do you have any specific target areas you want to focus on?',
    'How much time can you dedicate to each workout session?',
    'What is your current fitness level?',
    'Do you have any existing injuries or health conditions that may affect your workouts?',
    'What type of exercises do you enjoy or prefer?',
    'Do you have access to a gym or will you be working out at home?',
    'Do you have any allergies or foods you dislike? ',
  ];

  final List<List<String>> options = [
    ['Lose weight', 'Build muscle','Improve fitness'], // Options for Question 1
    ['Abs', 'Arms', 'Legs or Other'], // Options for Question 2
    ['30 minutes', '1 hour', '2 hours'],
    ['Beginner', 'Intermediate', 'Advanced'],
    ['Yes', 'No', "Can't tell"],
    ['Cardio', 'Yoga', "Strength Training"],
    ['At Gym', 'At Home', "other"],
    ['Yes', 'No', "Can't tell"],
     // Options for Question 3
    // Add options for the remaining questions here
  ];

  int currentQuestionIndex = 0;
  double sliderValue = 0.0;
  bool surveyCompleted = false;

 @override
Widget build(BuildContext context) {
  return SafeArea(
    child: Stack(
      children: [
        if (!surveyCompleted)
          Container(
            color: Colors.grey.shade100,
            child: Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: SizedBox(
                      height: 10.0,
                      child: Slider(
                        value: sliderValue,
                        min: 0,
                        max: questions.length - 1,
                        divisions: questions.length - 1,
                        onChanged: (double value) {
                          setState(() {
                            sliderValue = value;
                            currentQuestionIndex = value.toInt();
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          surveyCompleted
                              ? 'Thank you!'
                              : questions[currentQuestionIndex],
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(height: 16.0),
                        // Text(
                        //   'Options:',
                        //   style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        // ),
                        SizedBox(height: 8.0),
                        AnimationLimiter(
                          child: Column(
                            children: AnimationConfiguration.toStaggeredList(
                              duration: const Duration(milliseconds: 500),
                              childAnimationBuilder: (widget) => SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: widget,
                                ),
                              ),
                              children: getOptions(), // Generate options dynamically
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (surveyCompleted)
          Center(
            child: Container(
              color: Colors.grey.shade100,
              child: Dialog(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/thankyou.png', height: 220),
                      Text(
                        'Thank you for completing the survey!',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the "Thank you" dialog
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkoutScreen(),
                            ),
                          ); // Close the survey dialog
                        },
                        child: Text('Close'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
           Align(
            alignment: Alignment.topRight,
             child: Padding(
               padding: const EdgeInsets.only(right: 10),
               child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the "Thank you" dialog
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WorkoutScreen(),
                                ),
                              ); // Close the survey dialog
                            },
                            child: Text('Skip'),
                          ),
             ),
           ),
  
      ],
    ),
  );
}
  List<Widget> getOptions() {
    List<String> currentOptions = options[currentQuestionIndex];

    return currentOptions.map((option) {
      return ChoiceButton(
        text: option,
        onPressed: () => showNextQuestion(),
      );
    }).toList();
  }

  void showNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        sliderValue = currentQuestionIndex.toDouble();
      });
    } else {
      setState(() {
        surveyCompleted = true;
      });
    }
  }
}




class ChoiceButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ChoiceButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:gym_app/workoutScreen/WorkoutScreen.dart';

// class SurveyDialog extends StatefulWidget {
//   @override
//   _SurveyDialogState createState() => _SurveyDialogState();
// }

// class _SurveyDialogState extends State<SurveyDialog> {
//   final List<String> questions = [
//     'What is your primary fitness goal? ',
//     'Do you have any specific target areas you want to focus on?',
//     "How much time can you dedicate to each workout session?",
//     "What is your current fitness level?",
//     "Do you have any existing injuries or health conditions that may affect your workouts?",
//     "What type of exercises do you enjoy or prefer?",
//     'Do you have access to a gym or will you be working out at home?',
//     "Do you have any allergies or foods you dislike? ",
//     "How many meals and snacks do you typically have in a day?",
//     "Are you looking to gain, lose, or maintain weight?"
//   ];
  
  

//   int currentQuestionIndex = 0;
//   double sliderValue = 0.0;
//   bool surveyCompleted = false;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         if (!surveyCompleted)
//           Container(
//             color: Colors.grey.shade100,
//             child: Dialog(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                     child: SizedBox(
//                       height: 10.0,
//                       child: Slider(
//                         value: sliderValue,
//                         min: 0,
//                         max: questions.length - 1,
//                         divisions: questions.length - 1,
//                         onChanged: (double value) {
//                           setState(() {
//                             sliderValue = value;
//                             currentQuestionIndex = value.toInt();
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(16.0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           surveyCompleted
//                               ? 'Thank you!'
//                               : questions[currentQuestionIndex],
//                           style: TextStyle(fontSize: 20.0),
//                         ),
//                         SizedBox(height: 16.0),
//                         AnimationLimiter(
//                           child: Column(
//                             children: AnimationConfiguration.toStaggeredList(
//                               duration: const Duration(milliseconds: 500),
//                               childAnimationBuilder: (widget) => SlideAnimation(
//                                 verticalOffset: 50.0,
//                                 child: FadeInAnimation(
//                                   child: widget,
//                                 ),
//                               ),
//                               children: [

//                                 ChoiceButton(
//                                   text: 'Option 1',
//                                   onPressed: () => showNextQuestion(),
//                                 ),
//                                 ChoiceButton(
//                                   text: 'Option 2',
//                                   onPressed: () => showNextQuestion(),
//                                 ),
//                                 ChoiceButton(
//                                   text: 'Option 3',
//                                   onPressed: () => showNextQuestion(),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         if (surveyCompleted)
//           Center(
//             child: Container(
//               color: Colors.grey.shade100,

//               child: Dialog(
//                 child: Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                        Image.asset('assets/thankyou.png',height: 220,),
//                       Text(
//                         'Thank you for completing the survey!',
//                         style: TextStyle(fontSize: 20.0),
//                       ),
//                       SizedBox(height: 16.0),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context); // Close the "Thank you" dialog
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       WorkoutScreen())); // Close the survey dialog
//                         },
//                         child: Text('Close'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }

//   void showNextQuestion() {
//     if (currentQuestionIndex < questions.length - 1) {
//       setState(() {
//         currentQuestionIndex++;
//         sliderValue = currentQuestionIndex.toDouble();
//       });
//     } else {
//       setState(() {
//         surveyCompleted = true;
//       });
//     }
//   }
// }

// class ChoiceButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;

//   const ChoiceButton({required this.text, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8.0),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         child: Text(text),
//       ),
//     );
//   }
// }
