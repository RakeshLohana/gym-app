import 'package:flutter/material.dart';
import 'package:gym_app/Error/survey.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        MaterialButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SurveyDialog();
              },
            );
          },
          child: Text('Start Survey'),
        ),
      ]),
    );
  }
}
