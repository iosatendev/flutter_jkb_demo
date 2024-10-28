import 'package:flutter/material.dart';

void main() {
  runApp(const MyInfoApp());
}

class MyInfoApp extends StatelessWidget {
  const MyInfoApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My Info"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
        ),
        body: const MyInfoScreen(),
      ),
    );
  }
}

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          width: 300,
          child: Image.asset("assets/images/sp.jpg")),
          // Image.network("https://img.freepik.com/free-photo/beautiful-mountains-landscape_23-2150787888.jpg"),
        const SizedBox(height: 50,),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person),
            Text("Name: Satyendra Pandey", 
            style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.w500),)
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite),
            Text("Hobby: Eat, Code, Sleep, Repeat"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info),
            Text("About Me: I am a Senior Software Engineer 👽")
          ],)
        ,
      ],
    );
}

}
