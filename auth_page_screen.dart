import 'package:flutter/material.dart';
import 'package:namer_app/wscube_leactrues/auth_services.dart';
import 'package:namer_app/wscube_leactrues/fingerprint_home_screen.dart';

class AuthPageScreen extends StatefulWidget {
  const AuthPageScreen({super.key});

  @override
  State<AuthPageScreen> createState() => _AuthPageScreenState();
}

class _AuthPageScreenState extends State<AuthPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auth Screen"),
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            setState(() async {
              bool check = await AuthServices().authenticateLocally();
              if (check) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePageScreen()));
              }
            });
          },
          icon: Icon(Icons.fingerprint),
        ),
      ),
    );
  }
}
