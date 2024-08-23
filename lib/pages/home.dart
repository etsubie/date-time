import 'package:flutter/material.dart';
import 'package:myapp/pages/services/Navbar.dart';
import 'package:myapp/pages/services/world_time.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
Map data = {
  'time': 'Loading...',
  'ethiopianDate': 'Loading...',
  'gregorianDate': 'Loading...',
};


  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Addis Ababa',
        flag: 'ethiopia.png',
        url: 'Africa/Addis_Ababa');
    await instance.getTime();
    setState(() {
      data = {
        'time': instance.time,
        // 'isDaytime': instance.isDaytime,
        'location': instance.location,
        'ethiopianDate': instance.ethiopianDate,
        'gregorianDate': instance.gregorianDate,
      };
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
      backgroundColor: Colors.black,
      appBar: Navbar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data['time'] ?? 'Loading...',
                style: const TextStyle(
                    fontSize: 40.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'ሰኞ',
                style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                data['ethiopianDate'] ?? 'Loading...',
                style: const TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Image(
                image: NetworkImage(
                    'https://th.bing.com/th/id/OIP.E37tB7Amae90QhOYSVvymgHaFk?w=287&h=215&c=7&r=0&o=5&pid=1.7'),
                height: 250.0,
                width: 350.0,
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Text(
                'Monday',
                style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                data['gregorianDate'] ?? 'Loading...',
                style: const TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
