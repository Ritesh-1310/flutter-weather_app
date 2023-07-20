import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  LocationState createState() => LocationState();
}

class LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Location Screen"),
    );
  }
}
