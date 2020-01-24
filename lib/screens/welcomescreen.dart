import 'dart:async';
import 'package:flutter/material.dart';
import 'view_contact_list.dart';
import './dashboard.dart';


class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  
  
 @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
       navigateFromSplash();
    });
  }


 Future navigateFromSplash () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardPage()));
}
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
       child: Center(
          
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image:DecorationImage(
              image: AssetImage("assets/images/lion_head.png"),
              fit: BoxFit.contain,
              ),
          ),
        ),
       ),
      ),
    );
  }
}