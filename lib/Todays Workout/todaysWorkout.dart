import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/Todays%20Workout/CenterContainer.dart';
import 'package:gym_app/Todays%20Workout/todaysWorkOutContainer.dart';
import 'package:gym_app/animations/survey.dart';
import 'package:gym_app/RegisterScreens/MainScreen.dart';


class TodaysWorkout extends StatefulWidget {
  const TodaysWorkout({super.key});

  @override
  State<TodaysWorkout> createState() => _TodaysWorkoutState();
}

class _TodaysWorkoutState extends State<TodaysWorkout> {
 
  List weekDayText = ['MON', 'TUE', 'WED', 'THU','FRI',"SAT","SUN"];
    List workOut = ['CRUNCH', 'SITUP', 'REST', 'CRUNCH','SITUP','REST'];

   final _auth = FirebaseAuth.instance;


 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white
          
       
        ),
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
                  onTap: () {
                    
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
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => AnimationScreen())));
                  // Handle help menu item tap
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
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
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => MainScreen())));
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
              ),
            ],
          ),
        ),
        
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                          " Today's",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w400),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                          'Workout',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                        height: 10,
                  ),
           Expanded(
                  child: ListView.builder(
                      itemCount: weekDayText.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                             Text(
                      weekDayText[index],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                            TodaysWorkoutContainer( )
                          ],
                        );
                      }),
            ),
    
            SizedBox(height: 20,),
            
           CenterContainerWidget()
          
        
                ],
    
              ),
        ),
      ),
    );
  }
}
