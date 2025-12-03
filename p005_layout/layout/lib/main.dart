import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Container(
  //         color: Colors.deepOrange,
  //         margin: EdgeInsets.all(50),
  //         padding: EdgeInsets.only(top: 20, left: 20),
  //         child: Container(height: 200, width: 400, color: Colors.blue),
  //       ),
  //     ),
  //   );
  // }

  /*
    partie gerant les bordures
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepOrange.shade900, width: 3),
            borderRadius: BorderRadius.circular(40),
            image: DecorationImage(
              image: NetworkImage("https://bit.ly/3VBAIIg"),
              fit: BoxFit.cover,
            ),
            color: Colors.deepOrange[100],
          ),
        ),
      ),
    );
  }*/
  /*
       font ecran comme image
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(top: 200, left: 100),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://bit.ly/3VBAIIg"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Text(
          "les palmiers",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
  */
  /* challenge 6
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blue],
          ),
        ),
        child: Center(
          child: Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white10, Colors.white24],
              ),
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Text(
              "Degrades",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  } */
  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.deepOrange,
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 250),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
          ),
        ),
      ),
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://bit.ly/3G6c2Sr"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.topCenter,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black12, Colors.black],
            ),
          ),
          alignment: Alignment.center,
          child: const Text(
            "pizzaria",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 60,
            ),
          ),
        ),
      ),
    );
  }
}
