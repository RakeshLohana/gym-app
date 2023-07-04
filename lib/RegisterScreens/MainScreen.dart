import 'package:flutter/material.dart';
import 'package:gym_app/widget/NavigatorButton.dart';
import 'package:gym_app/RegisterScreens/RegisterAccount.dart';
import 'package:gym_app/widget/ReusableButton.dart';
import 'package:gym_app/survey/survey.dart';
import 'package:gym_app/widget/textField.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        'assets/gym.png',
                        fit: BoxFit.cover,
                        height: 350,
                      )),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daily',
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
                      Text(
                        'start Today !',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 240,
                      ),
                      ReusableButton(
                        textitem: 'Register New Account',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => RegisterAccount())));
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Or',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        textitem: 'Username',
                        icon: Icon(
                          Icons.drive_file_rename_outline,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        textitem: 'Password',
                        icon: Icon(
                          Icons.lock,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: NavigatorButton(
                            textitem: 'GO',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => SurveyDialog())));
                            },
                          )),
                      SizedBox(
                        height: 10,
                      ),

                     
                    ]),
                     Align(
            alignment: Alignment.topRight,
             child: Container(
              height: 30,
              
              width: 30,
               child: Center(child: Text('?')),
               decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade100,
                border: Border.all(
                color: Colors.black
               )),
             ),
           ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
