import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ScrollableWidget extends StatelessWidget {
  final List _items = List.generate(50, (i) => i + 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Example"),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, int i) {
          return Text(
            "Item ${_items[i]}",
            style: TextStyle(fontSize: 18.0),
          );
        },
      ),
    );
  }
}
