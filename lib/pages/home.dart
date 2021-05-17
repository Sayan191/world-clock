import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    Color fontColor;
    String bgImage;
    Color bgColor;
    const DayStyle = Colors.black;
    const NightStyle = Colors.white;
    const EvenStyle = Colors.green;
    const noonStyle = Colors.green;
    const notFound = Colors.yellow;

    // set background image
    print(data['isDaytime']);
    if (data['isDaytime'] == null) {
      bgImage = "404.png";
      fontColor = notFound;
    } else {
      if (data['isDaytime'] == "day") {
        bgImage = "day.png";
        fontColor = DayStyle;
        bgColor = Colors.blue;
      } else if (data['isDaytime'] == "night") {
        bgImage = "night.png";
        fontColor = NightStyle;
        bgColor = Colors.indigo[700];
      } else if (data['isDaytime'] == "evening") {
        bgImage = "evening.jpg";
        fontColor = EvenStyle;
        bgColor = Colors.red[500];
      } else if (data['isDaytime'] == "afternoon") {
        bgImage = "noon.jpg";
        fontColor = noonStyle;
        bgColor = Colors.orange[700];
      }
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        "location": result['location'],
                        "time": result['time'],
                        "isDaytime": result['isDaytime']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: fontColor,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 45.0,
                          letterSpacing: 2.0,
                          color: fontColor,
                          fontFamily: "Megrim"),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(data['time'],
                    style: TextStyle(
                        fontSize: 70.0,
                        color: fontColor,
                        letterSpacing: 2.0,
                        fontFamily: "Megrim")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
