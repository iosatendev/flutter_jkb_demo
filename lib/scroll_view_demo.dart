import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Color Pallet"), 
        backgroundColor: Colors.white70,
        ),
        body: const ColorPallet(),
    ),
  ));
}

class ColorPallet extends StatelessWidget {
  const ColorPallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              gridView(color: Colors.red, colorName: "Red"),
              gridView(color: Colors.green, colorName: "Green"),
              gridView(color: Colors.blue, colorName: "Blue"),
            ],
            ),
          ),
          Flexible(child: SingleChildScrollView(
            child: Column(children: [
              cellView(color: Colors.red, colorName: "Red"),
              cellView(color: Colors.green, colorName: "Green"),
              cellView(color: Colors.blue, colorName: "Blue"),
              cellView(color: Colors.yellow, colorName: "Yellow"),
              cellView(color: Colors.orange, colorName: "Orange"),
              cellView(color: Colors.cyan, colorName: "Cyan"),
            ],),
          ))
          
          
        ],
    );
  }

  Widget gridView({required Color color, required String colorName}) {
    return  Container(
              height: 200,
              width: 200,
              color: color,
              margin: const EdgeInsets.only(right: 10),
              child: Center(child: Text(colorName)),
            );
  }

  Widget cellView({required Color color, required String colorName}) {
    return Container(
            height: 200,
            color: color,
            margin: const EdgeInsets.only(bottom: 10),
            child: Center(child: Text(colorName)),
          );
  }
  }