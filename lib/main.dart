import 'package:flutter/material.dart';
import 'feature/home/presentation/views/loading.dart';
import 'feature/home/presentation/views/success.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loading(), 
  }
}
