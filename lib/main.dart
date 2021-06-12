import 'package:flutter/material.dart';
import 'package:tttgame/homepage.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    debugShowCheckedModeBanner: false,
    title: "TIC TAC TOE",
    home: HomePage(),
  ));
}
