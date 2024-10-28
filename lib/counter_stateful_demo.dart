import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Counter App"),),
      body: const CounterApp(),
    ),
  ));
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<StatefulWidget> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("$_counter", 
        style: const TextStyle(fontSize: 300, fontWeight: FontWeight.w100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _decrementCounter, child: const Icon(Icons.remove)),
            SizedBox(width: 100,),
            ElevatedButton(onPressed: _incrementCounter, child: const Icon(Icons.add)),
        ],)

      ],
    );
  }

  void _incrementCounter() {
    setState(() {
          _counter++;
    });
    log("Counter Value: $_counter");
  }

  void _decrementCounter() {
    setState(() {
      
    });
    _counter--;
        log("Counter Value: $_counter");
  }

}