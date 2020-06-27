import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Jakarta", flag: "jakarta.png", url: "Asia/Jakarta");
    await instance.getTime();
    print(instance.time);
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "time": instance.time,
      "flag": instance.flag,
      'isDayTime': instance.isDayTime
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
        body: Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.transparent,
        padding: EdgeInsets.all(20),
        child: SpinKitCircle(
          color: Colors.blue,
          size: 80,
        ),
      ),
    ));
  }
}
