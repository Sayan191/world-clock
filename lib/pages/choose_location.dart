import 'package:flutter/material.dart';
import 'package:wc/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    //Asia
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata'),
    WorldTime(url: 'Asia/Baghdad', location: 'Baghdad'),
    WorldTime(url: 'Asia/Bangkok', location: 'Bangkok'),
    WorldTime(url: 'Asia/Shanghai', location: 'Shanghai'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore'),

    //Europe
    WorldTime(url: 'Europe/London', location: 'London'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin'),
    WorldTime(url: 'Europe/Paris', location: 'Paris'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow'),

    //Africa
    WorldTime(url: 'Africa/Cairo', location: 'Cairo'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi'),
    WorldTime(url: 'Africa/Johannesburg', location: 'Johannesburg'),

    //america
    WorldTime(url: 'America/Chicago', location: 'Chicago'),
    WorldTime(url: 'America/New_York', location: 'New York'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles'),
    WorldTime(url: 'America/Puerto_Rico', location: 'Puerto Rico'),

    //Australia
    WorldTime(url: 'Australia/Sydney', location: 'Sydney'),
    WorldTime(url: 'Australia/Melbourne', location: 'Melbourne'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      "location": instance.location,
      "time": instance.time,
      "isDaytime": instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 4.0),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          updateTime(index);
                        },
                        title: Center(
                            child: Text(locations[index].location,
                                style: TextStyle(
                                    fontFamily: "Megrim",
                                    fontSize: 20.0,
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.bold))),
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/compass.png'),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
