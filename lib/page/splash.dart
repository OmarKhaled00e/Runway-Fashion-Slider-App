import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:runwayfashion_app/page/home.dart';
import 'package:runwayfashion_app/widgets/animation_line.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (x) => Home()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Center(child: Image.asset('assets/image/Runway.png', width: 188)),
          Gap(10),
          AnimationLine(),
        ],
      ),
    );
  }
}
