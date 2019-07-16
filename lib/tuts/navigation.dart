import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: Text("Navigation Example"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FlatButton(
          color: Colors.redAccent,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Go to Next Screen",
              style: TextStyle(color: Colors.white),
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return SecondScreen();
              }),
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: Text("Navigation Example"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FlatButton(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Go Back",
              style: TextStyle(color: Colors.white),
            ),
          ),
          color: Colors.redAccent,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
