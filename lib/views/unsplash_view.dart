import 'package:flutter/material.dart';
import 'package:notes_app/views/notes_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double opacity = 0.0; 

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        opacity = 1.0; 
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NotesView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1C1C), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacity,  
              duration: const Duration(seconds: 2), 
              child: Image.asset(
                'assets/images/taking-notes-concept-illustration-b.png',
                height: 320,
                width: 320,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 5),
            AnimatedOpacity(
              opacity: opacity,  
              duration: const Duration(seconds: 2), 
              child: const Text(
                'QuickNote', 
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 34, 
                  fontWeight: FontWeight.bold, 
                  fontFamily: "Poppins"
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

