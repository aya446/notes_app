import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 32,
      backgroundColor: Colors.blue,
    );
  }
}



class ColorsListview extends StatelessWidget {
  const ColorsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32*2 ,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const ColorItem();
        },
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        
        ),
    );
  }
}