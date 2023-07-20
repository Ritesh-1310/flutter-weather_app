import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/Models/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  String city = "Patna";
  String temp = '';
  String hum = '';
  String airSpeed = '';
  String des = '';
  String main = '';
  String loc = '';
  String icon = '';

  void startApp(String city) async {
    Worker instance = Worker(location: city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    airSpeed = instance.airSpeed;
    des = instance.description;
    main = instance.main;
    loc = instance.location!;
    icon = instance.icon;

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "airSpeed_value": airSpeed,
        "des_value": des,
        "main_value": main,
        "loc_value": loc,
        "icon_value": icon,
        "city_value": city,
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cityName = ["Mumbai", "Delhi", "Chennai", "Dhar", "Indore", "London"];
    final _random = Random();
    var city = cityName[_random.nextInt(cityName.length)];
    final search =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    if (search?.isNotEmpty ?? false) {
      city = search!['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 180,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 180,
                  ),
                  Image.asset(
                    "assets/images/mlogo-removebg-preview.png",
                    height: 240,
                    width: 240,
                  ),
                ],
              ),
              const Text(
                "Weather App",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Made By Ritesh Ranjan",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              const SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
