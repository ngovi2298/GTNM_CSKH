import 'package:GTNM_CSKH/DetailScreen.dart';
import 'package:GTNM_CSKH/ListEmailScreen.dart';
import 'package:GTNM_CSKH/ListScreen.dart';
import 'package:GTNM_CSKH/LoginScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListEmailScreen(),
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

