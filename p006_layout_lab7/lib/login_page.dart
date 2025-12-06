import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // partie gerant l'icon
          const Icon(
            Icons.account_box_rounded,
            size: 100,
            color: Colors.deepPurple,
          ),
          //partie gerant  le texte
          const Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
          ),

          // espace
          const SizedBox(height: 50),
          //email
          Container(
            padding: EdgeInsets.only(left: 25),
            margin: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Email",
                icon: Icon(Icons.email_outlined),
              ),
            ),
          ),
          //deuxieme champs
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 25),
            margin: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "PassWord",
                icon: Icon(Icons.lock_clock_outlined),
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                elevation: 10,
              ),
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Register", style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
