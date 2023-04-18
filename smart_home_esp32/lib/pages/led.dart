// ignore_for_file: unnecessary_import, implementation_imports, unused_import, unused_field, prefer_const_constructors, prefer_final_fields, avoid_print, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'ledStatus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class LED extends StatefulWidget {
  const LED({super.key});

  @override
  State<LED> createState() => _LEDState();
}

class _LEDState extends State<LED> {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  var isChanged = true;

  double _value = 0;

  // create some values
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            margin: EdgeInsets.only(top: 50),
            width: 350,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/hiasan2.jpg'), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            )),

        //CONTENT
        Container(
          height: 450,
          margin: EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //SERVO CONTROL
              Container(
                child: Center(
                  child: SfSlider.vertical(
                    min: 0.0,
                    max: 180.0,
                    value: _value,
                    interval: 20,
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: (dynamic value) async {
                      final snapshot = ref.child('SERVO');
                      final getSnapshotValue = await snapshot.get();
                      snapshot.update({'SERVO': value.round()});

                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                ),
                width: 150,
                height: 390,
              ),

              //LED
              Container(
                  padding: EdgeInsets.only(top: 30, bottom: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //led
                      InkWell(
                        onTap: () async {
                          setState(() => isChanged = !isChanged);

                          final snapshot = ref.child('LED');
                          final getSnapshotValue = await snapshot.get();
                          String getLed = getSnapshotValue.value.toString();
                          bool ledStatus = getLed == '{LED: true}';


                          snapshot.update({'LED': !ledStatus});
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: isChanged ? ledOn : ledOff,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          width: 180,
                          height: 180,
                        ),
                      ),

                      //RGB
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  title: Text("Confirmation"),
                                  content: ColorPicker(
                                      displayThumbColor: true,
                                      enableAlpha: false,
                                      pickerColor: pickerColor,
                                      onColorChanged: changeColor),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          setState(
                                              () => currentColor = pickerColor);
                                          Navigator.of(context).pop();

                                          //DATABASE MANIPULATION
                                          int RED = pickerColor.red;
                                          int GREEN = pickerColor.green;
                                          int BLUE = pickerColor.blue;

                                          final snapshot = ref.child('RGB');
                                          snapshot.update({
                                            "RED": RED,
                                            "GREEN": GREEN,
                                            "BLUE": BLUE
                                          });
                                        },
                                        child: Text("Confirm")),
                                  ],
                                );
                              }));
                        },
                        child: Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: rgbLed),
                          decoration: BoxDecoration(
                            color: pickerColor,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          width: 180,
                          height: 180,
                        ),
                      )
                    ],
                  ))
            ],
          ),
        )
      ],
    ));
  }
}
