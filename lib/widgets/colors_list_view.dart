import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final int color ;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: isActive
            ? CircleAvatar(
                radius: 32,
                backgroundColor: Colors.white,
                child: CircleAvatar(radius: 29, backgroundColor: Color(color)),
              )
            : CircleAvatar(
                radius: 29, backgroundColor: Color(color)));
  }
}

class ColorsListview extends StatefulWidget {
  const ColorsListview({
    super.key,
  });

  @override
  State<ColorsListview> createState() => _ColorsListviewState();
}

class _ColorsListviewState extends State<ColorsListview> {
  int currentIndex = 0;
  List<int> colorsList =[ 0xFFff7092 , 0xFFff8e8a , 0xFFffb8a8 , 0xFFffcdb8 , 0xffffeedb ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex= index;
              setState(() {
                
              });
            },
              child: ColorItem(
              color: colorsList[index],
              isActive: currentIndex == index ? true : false,
          ),);
        },
        itemCount: colorsList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
