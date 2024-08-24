import 'package:flutter/material.dart';
import 'package:myapp/pages/convert.dart';
import 'pages/loading.dart';
import 'pages/home.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
     initialRoute: '/home',
     routes: {
       '/': (context) => const Loading(),
       '/home': (context) => const Home(),
       '/convert': (context) => const Convert_Date(),
       },
    ));
