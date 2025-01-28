import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final int color ;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9.0),
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
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex= index;
              BlocProvider.of<AddNoteCubit>(context).color = kColorsList[index];
              setState(() {
                
              });
            },
              child: ColorItem(
              color: kColorsList[index],
              isActive: currentIndex == index ? true : false,
          ),);
        },
        itemCount: kColorsList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
