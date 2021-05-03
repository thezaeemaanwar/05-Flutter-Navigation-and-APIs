import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future fetchEventPlanningServices() async {
  var uri = Uri.parse("https://pcc.edu.pk/ws/list/eventplanningservices.php");
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Failed to retrieve data");
  }
}

class RetrieveRecords extends StatefulWidget {
  RetrieveRecords({Key key}) : super(key: key);

  _RetrieveRecordsState createState() => _RetrieveRecordsState();
}

class _RetrieveRecordsState extends State<RetrieveRecords> {
  Future futureEventPlanningServices;

  @override
  void initState() {
    super.initState();
    futureEventPlanningServices = fetchEventPlanningServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(children: [
          FutureBuilder(
              future: futureEventPlanningServices,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DataTable(
                      columns: [
                        DataColumn(label: Text('ID')),
                        DataColumn(label: Text('Title')),
                        DataColumn(label: Text('Description')),
                        DataColumn(label: Text('Type')),
                      ],
                      rows: snapshot.data
                          .map<DataRow>((row) => DataRow(cells: [
                                DataCell(Text(row["id"])),
                                DataCell(Text(row["title"])),
                                DataCell(Text(row["description"])),
                                DataCell(Text(row["type"])),
                                // DataCell(Text(row["type"])),
                              ]))
                          .toList());
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ])));
  }
}
