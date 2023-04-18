import 'package:flutter/material.dart';

InkWell waterStatus() {
  return InkWell(
    onTap: () {
      print("WATER LEVEL PRESSED");
    },
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(AssetImage('assets/icons/water-level.png')),
                Text("Water level")
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Center(
              child: Text(
                "50%", //VALUES
                style: TextStyle(fontSize: 85, fontFamily: 'CaviarDreams'),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: 180,
      height: 180,
    ),
  );
}

InkWell rfidLogs() {
  return InkWell(
    onTap: () {
      print("RFID PRESSED");
    },
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Image.asset(
                'assets/icons/rfid.png',
                fit: BoxFit.cover,
                width: 120,
                height: 120,
              )),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Center(
              child: Text(
                "RFID LOGS",
                style: TextStyle(fontSize: 20, fontFamily: 'CaviarDreams'),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: 180,
      height: 180,
    ),
  );
}

InkWell temperature() {
  return InkWell(
    onTap: () {
      print("TEMPERATURE PRESSED");
    },
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(AssetImage('assets/icons/temperature.png')),
                Text("Temperature")
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Center(
              child: Text(
                "50°",
                style: TextStyle(fontSize: 85, fontFamily: 'CaviarDreams'),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: 180,
      height: 180,
    ),
  );
}

InkWell humidity() {
  return InkWell(
    onTap: () {
      print("HUMIDITY PRESSED");
    },
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(AssetImage('assets/icons/humidity.png')),
                Text("Humidity")
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Center(
              child: Text(
                "50%",
                style: TextStyle(fontSize: 85, fontFamily: 'CaviarDreams'),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: 180,
      height: 180,
    ),
  );
}
