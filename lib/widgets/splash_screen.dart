import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({
    super.key,
    required this.opacity,
  });

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}