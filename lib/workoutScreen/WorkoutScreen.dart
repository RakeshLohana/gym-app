import 'package:flutter/material.dart';
import 'package:gym_app/workoutScreen/WorkoutContainer.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List area = ['assets/muscle.png', 'assets/abs.png', 'assets/west.png','assets/more.png'];
  List areaText = ['ARMS', 'Chest', 'Belly','More'];
  List activity = ['assets/dumble.png', 'assets/cardio.png', 'assets/cycle.png','assets/more.png'];
  List activityText = ['Stength', 'Cardio', 'cycling','More'];

  List mode = ['assets/weight.png', 'assets/timer.png', 'assets/more.png'];
  List modeText = ['Lose Weight', 'Intense', 'More'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [
          InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.menu),
              ))
        ]),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
            Text(
              'Choose a ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              'Workout',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Area ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: area.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                return WorkoutContiner(link: area[index], text: areaText[index]);
              }),
            ),
             Text(
              'Activity',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
              Expanded(
              child: ListView.builder(
                itemCount: activity.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                return WorkoutContiner(link: activity[index], text: activityText[index]);
              }),
            ),
             Text(
              'Mode ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
              Expanded(
              child: ListView.builder(
                itemCount: mode.length,

                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                return WorkoutContiner(link: mode[index], text: modeText[index]);
              }),
            )
          ]),
        ),
      ),
    );
  }
}
