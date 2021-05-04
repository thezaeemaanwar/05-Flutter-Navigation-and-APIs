import 'package:flutter/material.dart';
import 'addRecords.dart';
import 'retrieveRecords.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        canvasColor: Colors.white,
      ),
      home: MyHomePage(title: 'Event Planning App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: Drawer(
            child: ListView(children: [
          DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/profile.png"),
                        radius: 40,
                      )),
                  Text(
                    "Zaeema Anwar",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "thezaeemaanwar@gmail.com",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Colors.deepOrange)),
          TextButton(
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddRecords()))
                  },
              child: Row(children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.add,
                      color: Colors.deepOrange,
                    )),
                Text("Add Records"),
              ])),
          TextButton(
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RetrieveRecords()))
            },
            child: Row(children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.widgets,
                    color: Colors.deepOrange,
                  )),
              Text("Retrieve Records")
            ]),
          )
        ])),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/mobileDev.png'),
                width: 400,
              ),
              Text(
                "Event Planning App",
                style: TextStyle(fontSize: 40, color: Colors.deepOrange),
              ),
              Padding(
                padding: EdgeInsets.all(50),
                child: Text(
                  "This Application is a part of my flutter learning pathway. " +
                      "In this Appliction, I have utilized routing and integrated " +
                      "API calls to Add and Retrieve data",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ));
  }
}
