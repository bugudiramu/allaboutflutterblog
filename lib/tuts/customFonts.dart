import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:random_color/random_color.dart';

class CustomFonts extends StatefulWidget {
  @override
  _CustomFontsState createState() => _CustomFontsState();
}

class _CustomFontsState extends State<CustomFonts> {
  final List _items = List.generate(100, (i) => i + 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // FontAwesomeIcon
        leading: Icon(FontAwesomeIcons.alignLeft),
        title: Text(
          "Custom Fonts and Themes",
          style: TextStyle(fontSize: 15.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          // FontAwesomeIcon
          Icon(FontAwesomeIcons.search),
        ],
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, orientation) {
          return GridView.builder(
            itemCount: _items.length,
            itemBuilder: (BuildContext context, orientation) {
              return Container(
                alignment: Alignment.center,
                color: RandomColor().randomColor(),
                child: Text(
                  "Grid ${orientation + 1}",
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
            ),
          );
        },
      ),
    );
  }
}
