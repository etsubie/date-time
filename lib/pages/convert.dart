// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:myapp/pages/services/Navbar.dart';

class Convert_Date extends StatefulWidget {
  const Convert_Date({super.key});

  @override
  State<Convert_Date> createState() => _Convert_DateState();
}

class _Convert_DateState extends State<Convert_Date> {
  final TextEditingController _ethiopianDateController = TextEditingController();
  final TextEditingController _gregorianDateController = TextEditingController();

  // Function to check if a year is a leap year
  bool _isLeapYear(int year) {
    return (year % 4 == 3);
  }

 // Function to convert Ethiopian date to Gregorian date
String _convertEthiopianToGregorian(String ethiopianDate) {
  final parts = ethiopianDate.split('/');
  if (parts.length != 3) return 'Invalid Date';

  try {
    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);

    // Validate Ethiopian date
    if (day < 1 || day > (month == 13 ? (_isLeapYear(year) ? 6 : 5) : 30) || month < 1 || month > 13) {
      return 'Invalid Date';
    }

    // Calculate the Gregorian year
    int gregorianYear = year + 7;
    int gregorianMonth = 9;
    int gregorianDay = 11;

    // Adjust for Ethiopian New Year starting on September 11 (or 12 in leap years)
    DateTime gregorianNewYear = DateTime(gregorianYear, gregorianMonth, gregorianDay);
    if (_isLeapYear(gregorianYear)) {
      gregorianNewYear = DateTime(gregorianYear, gregorianMonth, gregorianDay + 1);
    }

    // Calculate the day of the year in the Ethiopian calendar
    int ethiopianDayOfYear = (month - 1) * 30 + day;
    if (month == 13) {
      ethiopianDayOfYear += (_isLeapYear(year) ? 6 : 5);
    }

    // Calculate the corresponding Gregorian date
    DateTime gregorianDate = gregorianNewYear.add(Duration(days: ethiopianDayOfYear - 1));

    // Format the Gregorian date
    String formattedDate = '${gregorianDate.month}/${gregorianDate.day}/${gregorianDate.year}';
    return formattedDate;
  } catch (e) {
    return 'Invalid Date';
  }
}

  void _onDateChanged(String value) {
    setState(() {
      _gregorianDateController.text = _convertEthiopianToGregorian(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: Navbar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'ቀን ያስገቡ',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextField(
                        controller: _ethiopianDateController,
                        decoration: const InputDecoration(
                          hintText: 'ቀን/ወር/አመት',
                        ),
                        onChanged: _onDateChanged,
                      ),
                       const Text(
                        'ቀን/ወር/አመት',         
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 150.0,
                thickness: 1.5,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'Converted Date',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextField(
                        controller: _gregorianDateController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          hintText: 'Converted Date',
                        ),
                      ),
                      const Text(
                        'MM-DD-YYYY',         
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
