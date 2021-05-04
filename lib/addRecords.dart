import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddRecords extends StatefulWidget {
  AddRecords({Key key}) : super(key: key);
  @override
  _AddRecordsState createState() => _AddRecordsState();
}

class _AddRecordsState extends State<AddRecords> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final typeController = TextEditingController();

  Future sendRecordsData() async {
    var sendURI =
        Uri.parse("https://pcc.edu.pk/ws/create/eventplanningservices.php");
    var response = await http.post(sendURI,
        body: jsonEncode({
          "title": titleController.text,
          "description": descriptionController.text,
          "type": typeController.text
        }));
    var result = jsonDecode(response.body);
    print(result);
  }

  void runAddRecord() {
    if (titleController.text.length < 1 &&
        descriptionController.text.length < 1 &&
        typeController.text.length < 1) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error Adding Event"),
              content: Text("Please make sure all the fields are filled"),
              actions: [
                TextButton(
                    onPressed: () => {Navigator.pop(context)},
                    child: Text("Okay"))
              ],
            );
          });
    } else {
      sendRecordsData();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Success"),
              content: Text("The request to add event sent successfully"),
              actions: [
                TextButton(
                    onPressed: () => {Navigator.pop(context)},
                    child: Text("Okay"))
              ],
            );
          });
      titleController.clear();
      descriptionController.clear();
      typeController.clear();
    }
    print("hello i am added");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: " Enter title here",
                  border:
                      OutlineInputBorder(borderSide: BorderSide(width: 3.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: "Enter description here",
                  border:
                      OutlineInputBorder(borderSide: BorderSide(width: 3.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: typeController,
                decoration: InputDecoration(
                  labelText: " Enter type here",
                  border:
                      OutlineInputBorder(borderSide: BorderSide(width: 3.0)),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text("Add Event"),
                  ),
                  onPressed: runAddRecord,
                ))
          ],
        ),
      ),
    );
  }
}
