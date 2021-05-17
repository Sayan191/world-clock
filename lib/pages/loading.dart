import 'package:flutter/material.dart';
import 'package:wc/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Kolkata', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 120.0),
              Text("Welcome Abroad",
                  style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.white,
                      letterSpacing: 1.0,
                      fontFamily: "Megrim")),
              SizedBox(height: 80.0),
              SpinKitFadingCube(
                color: Colors.white,
                size: 80.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
