import 'package:allaboutflutterblog/projects/todo/homePage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? ThemeData.dark()
          : ThemeData.light(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
