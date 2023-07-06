import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/RegisterScreens/MainScreen.dart';
import 'package:gym_app/animations/survey.dart';
import 'package:gym_app/workoutScreen/WorkoutContainer.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List area = [
    'assets/muscle.png',
    'assets/abs.png',
    'assets/west.png',
    'assets/more.png'
  ];
  List areaText = ['ARMS', 'Chest', 'Belly', 'More'];
  List activity = [
    'assets/dumble.png',
    'assets/cardio.png',
    'assets/cycle.png',
    'assets/more.png'
  ];
  List activityText = ['Stength', 'Cardio', 'cycling', 'More'];

  List mode = ['assets/weight.png', 'assets/timer.png', 'assets/more.png'];
  List modeText = ['Lose Weight', 'Intense', 'More'];
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [
          // InkWell(
          //     onTap: () {
          //       _scaffoldKey.currentState!.openDrawer();

          //     },
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 20),
          //       child: Icon(Icons.menu),
          //     ))
        ]),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/man.jpg'),
                        radius: 50,
                      ),
                    ),
                    SizedBox(width: 10),
                    Center(
                      child: Text(
                        'Gym App',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  // Handle home menu item tap
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  // Handle settings menu item tap
                },
              ),
              ListTile(
                leading: InkWell(
                   onTap: (){
                Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => AnimationScreen())));

              },
                  child: Icon(
                    Icons.question_mark_outlined,
                    color: Colors.black,
                  ),
                ),
                title: Text(
                  'Survey',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  // Handle help menu item tap
                },
              ),
              ListTile(
                leading: InkWell(
                   onTap: () {
                _auth.signOut().then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 3),
                      content: const Text('Logout Successfull'),
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height - 100,
                        left: 10,
                        right: 10,
                      ),
                    ),
                  );

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => MainScreen())));
                }).onError((error, stackTrace) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 3),
                      content: const Text('Error Occured'),
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height - 100,
                        left: 10,
                        right: 10,
                      ),
                    ),
                  );
                });
              },
                  child: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  // Handle logout menu item tap
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    return WorkoutContiner(
                        link: area[index], text: areaText[index]);
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
                    return WorkoutContiner(
                        link: activity[index], text: activityText[index]);
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
                    return WorkoutContiner(
                        link: mode[index], text: modeText[index]);
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
