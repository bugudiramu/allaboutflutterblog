import 'package:allaboutflutterblog/tuts/tabs_forms.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: TabsForms(),
      debugShowCheckedModeBanner: false,
      // Showing the Themes we will talk themes in later part of the tutorial
      theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.blue,
      ),
    ),
  );
}
