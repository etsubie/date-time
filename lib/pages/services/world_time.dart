import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/pages/services/conversion.dart';

class WorldTime {
  String location;
  String time = '';
  String flag;
  String url;
  String ethiopianDate = '';
  String gregorianDate = '';
  String gregorianDay = '';
  String ethiopianDay = '';

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

      // Get the day of the week in the Gregorian calendar
      gregorianDay = DateFormat.EEEE().format(now); 

      // Map the Gregorian day to the Ethiopian day
      ethiopianDay = _mapToEthiopianDay(gregorianDay);

      time = DateFormat.jm().format(now); 
      
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

  String _mapToEthiopianDay(String gregorianDay) {
    switch (gregorianDay) {
      case 'Monday':
        return 'ሰኞ';
      case 'Tuesday':
        return 'ማክሰኞ';
      case 'Wednesday':
        return 'ረቡዕ';
      case 'Thursday':
        return 'ሐሙስ';
      case 'Friday':
        return 'ዓርብ';
      case 'Saturday':
        return 'ቅዳሜ';
      case 'Sunday':
        return 'እሑድ';
      default:
        return '';
    }
  }
}
