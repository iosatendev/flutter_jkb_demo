import 'package:flutter/material.dart';

void  main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Center(
      widthFactor: 2,
      heightFactor: 1.5,
      child: Text(
        "Hello Students",
        textDirection: TextDirection.ltr,
        // textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red,
          fontSize: 50,
        ),),
    );
  }
  
}