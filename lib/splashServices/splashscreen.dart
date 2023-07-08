import 'package:flutter/material.dart';
import 'package:gym_app/splashServices/spalshServices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices sp = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sp.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Image.asset('assets/gym.png',height: 150,)),
    );
  }
}
