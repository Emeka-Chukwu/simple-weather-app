import 'package:flutter/material.dart';
import 'package:learningclip_path/display.dart';

void main() {
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
   home:HomeForClipPath1(),      
    );
  }
}