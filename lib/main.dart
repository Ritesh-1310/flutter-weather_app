import 'package:flutter/material.dart';
import 'package:weather_app/screens/home.dart';
import 'package:weather_app/screens/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // routings
    routes: { 
      "/": (context) => const Loading(), // default screen
      "/home": (context) => const Home(),
      "/loading": (context) => const Loading(),
    },
  ));
}
