import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/widget/NavigatorButton.dart';
import 'package:gym_app/RegisterScreens/RegisterAccount.dart';
import 'package:gym_app/widget/ReusableButton.dart';
import 'package:gym_app/widget/textField.dart';
import 'package:gym_app/workoutScreen/WorkoutScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isloading = false;
  final _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          'assets/gym.png',
                          fit: BoxFit.cover,
                          height: 350,
                        )),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
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
                                      builder: ((context) =>
                                          RegisterAccount())));
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
                            textitem: 'Email',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }

                              final emailRegex = RegExp(
                                  r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
                              if (!emailRegex.hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }

                              return null;
                            },
                            icon: Icon(
                              Icons.alternate_email_outlined,
                            ),
                            obscure: false,
                            controller: _email,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFieldWidget(
                            textitem: 'Password',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }

                              // You can add more password validation logic if required

                              return null;
                            },
                            icon: Icon(
                              Icons.lock,
                            ),
                            obscure: true,
                            controller: _password,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: NavigatorButton(
                                isloading: isloading,
                                textitem: 'GO',
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      isloading = true;
                                    });
                                    _formKey.currentState!.save();
                                    try {
                                      final newUser = await _auth
                                          .signInWithEmailAndPassword(
                                        email: _email.text,
                                        password: _password.text,
                                      )
                                          .then((value) {
                                        _email.clear();
                                        _password.clear();
                                        setState(() {
                                          isloading = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            duration: Duration(seconds: 3),
                                            content:
                                                const Text('Login Successfull'),
                                            behavior: SnackBarBehavior.floating,
                                            margin: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height -
                                                  100,
                                              left: 10,
                                              right: 10,
                                            ),
                                          ),
                                        );

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    WorkoutScreen())));
                                      }).onError((error, stackTrace) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            duration: Duration(seconds: 3),
                                            content:
                                                const Text('Error Occured'),
                                            behavior: SnackBarBehavior.floating,
                                            margin: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height -
                                                  100,
                                              left: 10,
                                              right: 10,
                                            ),
                                          ),
                                        );

                                        setState(() {
                                          isloading = false;
                                        });
                                      });

                                      if (newUser != null) {
                                        // Registration successful, do something
                                      }
                                    } catch (e) {
                                      // Registration failed, handle the error
                                    }
                                  }
                                },
                              )),
                          SizedBox(
                            height: 10,
                          ),
                        ]),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 30,
                      width: 30,
                      child: Center(child: Text('?')),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade100,
                          border: Border.all(color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
