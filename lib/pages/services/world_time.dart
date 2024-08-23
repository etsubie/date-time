import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/pages/services/conversion.dart';
// import 'package:myapp/pages/services/conversion.dart';

class WorldTime {
  String location;
  String time = '';
  String flag;
  String url;
  String ethiopianDate = '';
  String gregorianDate = '';

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      http.Response response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // isDaytime = now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now); // Example: 5:45 PM

      Map<String, dynamic> ethiopianDateObj =
          EthiopianDateConverter.fromGregorian(now);
      ethiopianDate =
          '${ethiopianDateObj['day']}/${ethiopianDateObj['month']}/${ethiopianDateObj['year']} E.C';

      gregorianDate = '${now.month}/${now.day}/${now.year} G.C';
    } catch (e) {
      print('caught error: $e');
      time = 'Could not get time data';
    }
  }
}
