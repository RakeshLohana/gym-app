import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gym_app/workoutScreen/WorkoutScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _leftAnimation;
  late Animation<double> _rightAnimation;
  late Animation<double> _center1Animation;
  late Animation<double> _center2Animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
          Duration(seconds: 2), // Increase the duration to slow down animations
    );

    _leftAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 0.75, curve: Curves.easeIn),
      ),
    );

    _rightAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.75, 1.0, curve: Curves.linearToEaseOut),
      ),
    );

    _center1Animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.75, 1, curve: Curves.linearToEaseOut),
      ),
    );

    _center2Animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.75, 1.0, curve: Curves.linearToEaseOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
    [
      'Lose weight',
      'Build muscle',
      'Improve fitness'
    ], // Options for Question 1
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
  final fireStore = FirebaseFirestore.instance.collection('surveyData1');
  List<Map<String, dynamic>> surveyDataList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              children: [
                Positioned(
                  right: 0,
                  bottom: 2,
                  child: Opacity(
                    opacity: _center2Animation.value,
                    child: Image.asset(
                      'assets/po1.png',
                      height: 500,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 2,
                  child: Opacity(
                    opacity: _center2Animation.value,
                    child: Image.asset(
                      'assets/po2.png',
                      height: 500,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Opacity(
                    opacity: _leftAnimation.value,
                    child: Image.asset(
                      'assets/f.png',
                      height: 342,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: Opacity(
                    opacity: _center1Animation.value,
                    child: Image.asset(
                      'assets/a.png',
                      height: 120,
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  right: 40,
                  child: Opacity(
                    opacity: _center2Animation.value,
                    child: Image.asset(
                      'assets/q1.png',
                      height: 70,
                    ),
                  ),
                ),
                Positioned(
                  top: 250,
                  right: 20,
                  left: 20,
                  child: Opacity(
                    opacity: _rightAnimation.value,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            if (!surveyCompleted)
                              Dialog(
                                shadowColor: Colors.grey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 8.0),
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
                                              currentQuestionIndex =
                                                  value.toInt();
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
                                                : questions[
                                                    currentQuestionIndex],
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          SizedBox(height: 16.0),
                                          AnimationLimiter(
                                            child: Column(
                                              children: AnimationConfiguration
                                                  .toStaggeredList(
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                childAnimationBuilder:
                                                    (widget) => SlideAnimation(
                                                  verticalOffset: 50.0,
                                                  child: FadeInAnimation(
                                                    child: widget,
                                                  ),
                                                ),
                                                children:
                                                    getOptions(), // Generate options dynamically
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (surveyCompleted)
                              Center(
                                child: Dialog(
                                  shadowColor: Colors.grey,
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset('assets/thankyou.png',
                                            height: 220),
                                        Text(
                                          'Thank you for completing the survey!',
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                        SizedBox(height: 16.0),
                                        ElevatedButton(
                                          onPressed: () {
                                            final user1 = FirebaseAuth
                                                .instance.currentUser;
                                            final email = user1!.email;
                                            String id = DateTime.now()
                                                .second
                                                .toString();
                                            fireStore.doc(email! + id).set({
                                              'surveyData': surveyDataList,
                                            }).then((value) {
                                              print('Data sent successfully');
                                            }).onError((error, stackTrace) {
                                              print('Error occured');
                                            });
                                            Navigator.pop(
                                                context); // Close the "Thank you" dialog
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    WorkoutScreen(),
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
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
            );
          },
        ),
      ),
    );
  }

  List<Widget> getOptions() {
    List<String> currentOptions = options[currentQuestionIndex];
    Map<String, dynamic> surveyData = {};

    return currentOptions.map((option) {
      return ChoiceButton(
          text: option,
          onPressed: () {
            showNextQuestion();

            if (currentQuestionIndex ==6) {
              surveyData = {
                'question': questions[7],
                'selectedOption': option,
              };
            } else {
              surveyData = {
                'question': questions[currentQuestionIndex-1],
                'selectedOption': option,
              };
            }

            surveyDataList.add(surveyData);
          });
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

      // DocumentReference surveyDocRef =
      //     FirebaseFirestore.instance.collection('surveyData').doc();
      // // surveyDocRef.set({
      //   'question': questions[currentQuestionIndex],
      //   'selectedOptions': selectedOptions,
      // }).then((value) {
      //   print('Data sent to Firestore');
      // }).catchError((error) {
      //   print('Error occurred: $error');
      // });
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
