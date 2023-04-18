// ignore_for_file: unnecessary_import, unused_import, prefer_const_constructors, implementation_imports, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LCD extends StatefulWidget {
  const LCD({super.key});

  @override
  State<LCD> createState() => _LCDState();
}

class _LCDState extends State<LCD> {
  List<TextEditingController> myController =
      List.generate(2, (i) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(
        children: [
          SizedBox(height: 50),
          SizedBox(
            width: 300,
            child: TextField(
                maxLength: 12,
                controller: myController[0],
                decoration: InputDecoration(
                  labelText: "First Line",
                  border: myinputborder(), //normal border
                  enabledBorder: myinputborder(), //enabled border
                  focusedBorder: myfocusborder(), //focused border
                  // set more border style like disabledBorder
                )),
          ),
          SizedBox(height: 40),
          SizedBox(
            width: 300,
            child: TextField(
                maxLength: 12,
                controller: myController[1],
                decoration: InputDecoration(
                  labelText: "Second Line",
                  border: myinputborder(), //normal border
                  enabledBorder: myinputborder(), //enabled border
                  focusedBorder: myfocusborder(), //focused border
                  // set more border style like disabledBorder
                )),
          ),
          SizedBox(height: 40),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 253, 243, 100)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
              onPressed: () async {
                DatabaseReference ref =
                    FirebaseDatabase.instance.ref().child('LCD');
                ref.update({
                  "LINE_1": myController[0].text,
                  "LINE_2": myController[1].text
                });
              },
              child: Text(
                "Write",
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

OutlineInputBorder myinputborder() {
  //return type is OutlineInputBorder
  return OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.redAccent,
        width: 3,
      ));
}

OutlineInputBorder myfocusborder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.greenAccent,
        width: 3,
      ));
}
