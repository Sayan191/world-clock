import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for UI
  String time; // the time in that location
  String url; // location url for api endpoint
  String isDaytime;
  // true or false if daytime or not

  WorldTime({this.location, this.url});

  Future<void> getTime() async {
    try {
      // make the request
      Uri uri = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      Response response = await get(uri);
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offHrs = data['utc_offset'].substring(0, 3);
      String offMin = data['utc_offset'].substring(4, 6);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now
          .add(Duration(hours: int.parse(offHrs), minutes: int.parse(offMin)));

      // set the time property
      if (now.hour >= 6 && now.hour < 12) {
        isDaytime = "day";
      } else if (now.hour >= 12 && now.hour < 16) {
        isDaytime = "afternoon";
      } else if (now.hour >= 16 && now.hour < 19) {
        isDaytime = "evening";
      } else {
        isDaytime = "night";
      }

      time = DateFormat.jm().format(now);
      print(time);
    } catch (e) {
      print("error caught $e");
      time = 'could not get time';
    }
  }
}
