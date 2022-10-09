import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'location.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width:  MediaQuery.of(context).size.width,
              child: Lottie.asset("assets/Lotties/1.json"),
            ),
            GestureDetector(
              child: Container(
                height:  MediaQuery.of(context).size.height * 0.1,
                width:  MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Text("Get Started",style: TextStyle(fontSize:25,fontWeight: FontWeight.bold),),
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => LocationApp()));
              },
            ),
          ],
        ),
    );
  }
}
