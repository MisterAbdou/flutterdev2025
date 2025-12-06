import "package:flutter/material.dart";

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  bool seSouvenir = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Banque Mobile", style: TextStyle(color: Colors.white)),
          leading: Icon(Icons.menu_sharp),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 150),

          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            border: Border.all(color: Colors.white30),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // nuermo client
              TextField(
                decoration: InputDecoration(
                  labelText: "Numero Client",
                  icon: Icon(Icons.person_outline, color: Colors.deepOrange),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Mot de passe",
                  icon: Icon(
                    Icons.lock_open_outlined,
                    color: Colors.deepOrange,
                  ),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                ),
              ),

              //
              SwitchListTile(
                value: seSouvenir,
                onChanged: (value) {
                  setState(() {
                    seSouvenir = value;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  "Se souvenir de moi",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Connexion"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.centerRight,
                child: Text(
                  "Mot de passe oublie ?",
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
