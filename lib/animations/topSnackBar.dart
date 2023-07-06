// import 'package:flutter/material.dart';

// class MyWidget extends StatelessWidget {
//   final String text;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SnackBar Demo'),
//       ),
//       body: Center(
//         child: Builder(
//           builder: (BuildContext context) {
//             return ElevatedButton(
//               child: Text('Show SnackBar'),
//               onPressed: () {
//                 final snackBar = SnackBar(
//                   content: Text('Hello, SnackBar!'),
//                   behavior: SnackBarBehavior.floating,
//                   margin: EdgeInsets.only(
//                       top: MediaQuery.of(context).padding.top + 8.0),
//                 );
//                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
