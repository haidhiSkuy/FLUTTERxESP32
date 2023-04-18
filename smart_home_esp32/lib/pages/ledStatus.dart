import 'package:flutter/material.dart';

//LED ON
List<Container> ledOn = [
  Container(
      margin: EdgeInsets.only(top: 10),
      child: Image.asset(
        'assets/icons/ledOn.png',
        fit: BoxFit.cover,
        width: 120,
        height: 120,
      )),
  Container(
    margin: EdgeInsets.only(bottom: 20),
    child: Center(
      child: Text(
        "LED ON",
        style: TextStyle(fontSize: 20, fontFamily: 'CaviarDreams'),
      ),
    ),
  ),
];



//LED OFF
List<Container> ledOff = [
  Container(
      margin: EdgeInsets.only(top: 10),
      child: Image.asset(
        'assets/icons/ledOff.png',
        fit: BoxFit.cover,
        width: 120,
        height: 120,
      )),
  Container(
    margin: EdgeInsets.only(bottom: 20),
    child: Center(
      child: Text(
        "LED OFF",
        style: TextStyle(fontSize: 20, fontFamily: 'CaviarDreams'),
      ),
    ),
  ),
];

List<Container> rgbLed = [
  Container(
      margin: EdgeInsets.only(top: 10),
      child: Image.asset(
        'assets/icons/rgb.png',
        fit: BoxFit.cover,
        width: 120,
        height: 120,
      )),
  Container(
    margin: EdgeInsets.only(bottom: 20),
    child: Center(
      child: Text(
        "RGB LED",
        style: TextStyle(fontSize: 20, fontFamily: 'CaviarDreams'),
      ),
    ),
  ),
];
