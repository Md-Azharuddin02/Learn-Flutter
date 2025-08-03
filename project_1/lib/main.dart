import 'package:flutter/material.dart';

void main() {
  runApp(FirstApp());
}

class FirstApp extends StatelessWidget {
  const FirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First App",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "This is the appbar",
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 204, 154, 2),
        ),
        body: Center(
          child: Container(
            // width: 300,
            // height: 300,
            padding: EdgeInsets.all(30),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              // color: Colors.yellow,
              image: DecorationImage(
                image: AssetImage('images/background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  const Color.fromARGB(255, 222, 222, 222),
                  BlendMode.darken,
                ),
                alignment: Alignment.topCenter,
                opacity: 0.8,
                filterQuality: FilterQuality.high,
              ),
            ),
            child: Text(
              "This is the center body",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
