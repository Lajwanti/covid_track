import 'dart:async';
import 'package:covid_track/View/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  @override

  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 3),
      vsync: this)..repeat();
  Timer?  _timer;

  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer(const Duration(seconds: 5), () {
     Navigator.push(context, MaterialPageRoute(builder: (context)=>const WorldStateScreen()));

    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Center(
              child: AnimatedBuilder(
                  animation: _animationController,
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Center(
                      child: Image(image: AssetImage("images/virus.png"),),
                    ),
                  ),
                  builder: (BuildContext context, Widget? child){
                    return Transform.rotate(
                        angle: _animationController.value *2.0*math.pi,
                      child: child,
                    );
                  }
              ),
            ),
            SizedBox(height:30),
            SizedBox(
              height: MediaQuery.of(context).size.height*.1,
              child: const Text("Covid-19\nTracker App",textAlign: TextAlign.center,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),),
            )

          ],
        ),
      ),

    );
  }
}
