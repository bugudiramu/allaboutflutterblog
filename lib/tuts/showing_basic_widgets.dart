import 'package:flutter/material.dart';

class ShowingBasicWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // scaffold gives default structure of the app by giving appbar and body
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic widget example"),
      ),
      body: Padding(
        //Gives padding from all the sides of 8px
        padding: const EdgeInsets.all(8.0),
        child: Center(
          // Centers all the elements
          child: Column(
            // Aligns all the widgets vertically
            children: <Widget>[
              Container(
                height: 150.0,
                width: 150.0,
                padding: const EdgeInsets.all(8.0),
                color: Colors.redAccent,
                child: Center(child: Text("Container")),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
              ),
              Text("Text-Widget: Showing Some Basic Widgets Example"),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
              ),
              Row(
                // Aligns all the widgets horizontally
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 100.0,
                    color: Colors.redAccent,
                    child: Center(child: Text("Row-Container")),
                  ),
                  Container(
                    height: 100.0,
                    width: 100.0,
                    color: Colors.blueAccent,
                    child: Center(
                      child: Text("Row-Container"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 100.0,
                        color: Colors.redAccent,
                        child: Center(child: Text("Column-Container")),
                      ),
                      Container(
                        height: 100.0,
                        width: 100.0,
                        color: Colors.blueAccent,
                        child: Center(child: Text("Column-Container")),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Image"),
              ),
              Image.asset(
                'images/c7.jpg',fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
