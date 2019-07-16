import 'Package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class GridList extends StatefulWidget {
  @override
  _GridListState createState() => _GridListState();
}

class _GridListState extends State<GridList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Working with Lists"),
        centerTitle: true,
        backgroundColor: RandomColor().randomColor(),
      ),
      body: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
          _showGrid(),
        ],
      ),
    );
  }
}

Widget _showGrid() {
  return Container(
    margin: const EdgeInsets.all(2.0),
    color: RandomColor().randomColor(),
    child: Center(
      child: Text(
        "Grid",
        style: TextStyle(
            color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
