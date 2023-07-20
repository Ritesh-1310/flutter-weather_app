import 'package:http/http.dart' as http;
import 'dart:convert';

class Worker {
  String? location;

  //Constructor
  Worker({this.location});

  String temp = '';
  String humidity = '';
  String airSpeed = '';
  String description = '';
  String main = '';
  String icon = '';

  //method
  Future<void> getData() async {
    try {
      var url =
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=abe0ad3b8b20546f13adee325ac6b283';
      var uri = Uri.parse(url);
      var response = await http.get(uri);
      var data = jsonDecode(response.body);

      //Getting Temp,Humidiy
      Map tempData = data['main'];
      String getHumidity = tempData['humidity'].toString();
      double getTemp = tempData['temp'] - 273.15;

      // Getting airSpeed
      Map wind = data['wind'];
      double getAirSpeed = wind["speed"] * 18 / 5;

      //Getting Description
      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getMainDes = weatherMainData['main'];
      String getDesc = weatherMainData["description"];
      String getIcon = weatherMainData["icon"];

      //Assigning Values
      temp = getTemp.toString();
      humidity = getHumidity;
      airSpeed = getAirSpeed.toString();
      description = getDesc;
      main = getMainDes;
      icon = getIcon;
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      airSpeed = "NA";
      description = "NA";
      main = "NA";
      icon = "09d";
    }
  }
}
