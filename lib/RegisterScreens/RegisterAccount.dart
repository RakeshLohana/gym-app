import 'package:flutter/material.dart';
import 'package:gym_app/widget/NavigatorButton.dart';
import 'package:gym_app/widget/textField.dart';
import 'package:gym_app/workoutScreen/WorkoutScreen.dart';

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({super.key});

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  // final _list = ["Male", "Female", "Other"];
  // String? _selectValue = '';
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

                      // ReusableButton(textitem: 'Register New Account'),
                      TextFieldWidget(
                        textitem: 'First Name',
                        icon: Icon(Icons.person_outline),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        textitem: 'Last Name',
                        icon: Icon(Icons.person_2_outlined),
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
                              hintText: 'Select an item',
                              
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        textitem: 'email',
                        icon: Icon(
                          Icons.alternate_email_outlined,
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

                      TextFieldWidget(
                        textitem: 'Confirm Password',
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
                                        builder: ((context) =>
                                            WorkoutScreen())));
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
                              'Sig in',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
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

  // DropdownButtonFormField<String> dropDown() {
  //   return DropdownButtonFormField(
  //     // Initial Value
  //     value: dropdownvalue,

  //     // Down Arrow Icon
  //     icon: const Icon(Icons.keyboard_arrow_down),

  //     // Array list of items
  //     items: items.map((String items) {
  //       return DropdownMenuItem(
  //         value: items,
  //         child: Text(items),
  //       );
  //     }).toList(),
  //     // After selecting the desired option,it will
  //     // change button value to selected value
  //     onChanged: (String? newValue) {
  //       setState(() {
  //         dropdownvalue = newValue!;
  //       });
  //     },
  //   );
  // }
}
