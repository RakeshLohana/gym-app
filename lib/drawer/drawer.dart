// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Drawer Example',
//       theme: ThemeData(
//         primaryColor: Colors.black,
//         accentColor: Colors.white,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   void _logout(BuildContext context) {
//     // Perform logout actions here
//     // For example, navigate to the login screen
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => LoginScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Drawer Example'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).primaryColor,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Menu',
//                     style: TextStyle(
//                       color: Theme.of(context).accentColor,
//                       fontSize: 24,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.home,
//                 color: Theme.of(context).accentColor,
//               ),
//               title: Text(
//                 'Home',
//                 style: TextStyle(
//                   color: Theme.of(context).accentColor,
//                   fontSize: 16,
//                 ),
//               ),
//               onTap: () {
//                 // Handle home menu item tap
//               },
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.settings,
//                 color: Theme.of(context).accentColor,
//               ),
//               title: Text(
//                 'Settings',
//                 style: TextStyle(
//                   color: Theme.of(context).accentColor,
//                   fontSize: 16,
//                 ),
//               ),
//               onTap: () {
//                 // Handle settings menu item tap
//               },
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.help,
//                 color: Theme.of(context).accentColor,
//               ),
//               title: Text(
//                 'Help',
//                 style: TextStyle(
//                   color: Theme.of(context).accentColor,
//                   fontSize: 16,
//                 ),
//               ),
//               onTap: () {
//                 // Handle help menu item tap
//               },
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.logout,
//                 color: Theme.of(context).accentColor,
//               ),
//               title: Text(
//                 'Logout',
//                 style: TextStyle(
//                   color: Theme.of(context).accentColor,
//                   fontSize: 16,
//                 ),
//               ),
//               onTap: () {
//                 _logout(context); // Call the logout function
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


