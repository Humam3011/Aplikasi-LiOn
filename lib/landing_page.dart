import 'package:flutter/material.dart';
import 'home_page.dart'; // Import file home_page.dart

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    // Delay navigasi ke home page
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _visible = false;
      });
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background.png'), // Sesuaikan dengan path gambar Anda
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 800),
              child: Image.asset(
                'images/lion.png', // Sesuaikan dengan path gambar Anda
                width: 150,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Center(
              child: AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Text(
                  'Li On application',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
