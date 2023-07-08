import 'package:flutter/material.dart';
import 'package:gym_app/Todays%20Workout/todaysWorkOutContainer.dart';

class CenterContainerWidget extends StatefulWidget {
  const CenterContainerWidget({Key? key});

  @override
  State<CenterContainerWidget> createState() => _CenterContainerWidgetState();
}

class _CenterContainerWidgetState extends State<CenterContainerWidget> {
  List workOut = ['CRUNCH', 'SITUP', 'REST', 'CRUNCH','SITUP','REST'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20, right: 10, left: 10),
      child: Container(
        height: 393,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
              spreadRadius: 3.0,
              offset: Offset(
                -5.0,
                5.0,
              ),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: workOut.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(workOut[index],style:TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),),
                        TodaysWorkoutContainer(),
                      ],
                    ),
                  ),
                  Divider(indent: 10,endIndent: 10,),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
