// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:myapp/pages/services/Navbar.dart';

class Convert_Date extends StatefulWidget {
  const Convert_Date({super.key});

  @override
  State<Convert_Date> createState() => _Convert_DateState();
}

class _Convert_DateState extends State<Convert_Date> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: Navbar(),
      body: const Center(
          child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'ቀን ያስገቡ',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'ወር/ቀን/አመት'
                      )
                    )
                  ],
                ),

              ),
            ),
            Divider(
              height: 150.0,
              thickness: 1.5,
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Converted Date',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextField(
                      
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
