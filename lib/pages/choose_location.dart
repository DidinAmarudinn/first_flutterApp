import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  //simulate request network to  get username
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: "London", flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: "Berlin", flag: 'germany.png'),
    WorldTime(url: 'Africa/Cairo', location: "Cairo", flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: "Nairobi", flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: "Chicago", flag: 'us.png'),
    WorldTime(url: 'America/New_York', location: "New York", flag: 'us.png'),
    WorldTime(url: 'Asia/Seoul', location: "Seoul", flag: 'south-korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: "Jakarta", flag: 'indonesia.png'),
  ];
  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      "location": instance.location,
      "time": instance.time,
      "flag": instance.flag,
      'isDayTime': instance.isDayTime
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.blue[900],
          title: Text("Choose a Location"),
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                      onTap: () {
                        updateTime(index);
                      },
                      title: Text(locations[index].location),
                      leading: Container(
                          width: 50,
                          height: 40,
                        child: Image(
                          image: AssetImage("assets/${locations[index].flag}"),fit: BoxFit.cover,),
                      )
                      ),
                ),
              );
            }));
  }
}
