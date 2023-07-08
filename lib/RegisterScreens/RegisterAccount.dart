import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/animations/survey.dart';
import 'package:gym_app/widget/NavigatorButton.dart';
import 'package:gym_app/widget/textField.dart';

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({super.key});

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  bool isloading = false;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirPassword = TextEditingController();
  // final TextEditingController _gender = TextEditingController();

  final List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  // Initial Selected Value
  String dropdownvalue = 'Male';

  // List of items in our dropdown menu
  var items = [
    'Male',
    'Female',
    'Other',
  ];
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _confirPassword.dispose();
    _password.dispose();
    super.dispose();
  }

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
                Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Now!',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFieldWidget(
                          textitem: 'First Name',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your First Name';
                            }

                            return null;
                          },
                          icon: Icon(Icons.person_outline),
                          obscure: false,
                          controller: _firstName,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          textitem: 'Last Name',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your First Name';
                            }

                            return null;
                          },
                          icon: Icon(Icons.person_2_outlined),
                          obscure: false,
                          controller: _lastName,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 12.0,
                                spreadRadius: 3.0,
                                offset: Offset(
                                  -5.0,
                                  5.0,
                                ),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: DropdownButtonFormField<String>(
                              value: dropdownvalue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: items.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          textitem: 'email',
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
                        TextFieldWidget(
                          textitem: 'Confirm Password',
                          validator: (value) {
                            if(value!=_password.text){
                              return 'Password and Confirm Password does not match';

                            }
                            
                            if (value!.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }

                            return null;
                          },
                          icon: Icon(
                            Icons.lock,
                          ),
                          obscure: true,
                          controller: _confirPassword,
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
                                          .createUserWithEmailAndPassword(
                                        email: _email.text,
                                        password: _password.text,
                                      )
                                          .then((value) {
                                        
                                        _email.clear();
                                        _password.clear();
                                        _firstName.clear();
                                        _lastName.clear();
                                        _confirPassword.clear();
                                        _password.clear();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            duration: Duration(seconds: 3),
                                            content: const Text(
                                                'Registered Successfull'),
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
                                                    AnimationScreen())));
                                        setState(() {
                                          isloading = false;
                                        });

                                        
                                      }).onError((error, stackTrace) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            duration: Duration(seconds: 3),
                                            content:
                                                const Text('Error Occured '),
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

                                  
                                    } catch (e) {
                                      // Registration failed, handle the error
                                    }
                                  }
                                })),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Already have an account ? ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
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
    );
  }
}
