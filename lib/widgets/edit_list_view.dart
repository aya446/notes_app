
import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';

class EditColorsList extends StatefulWidget {
  const EditColorsList({super.key, required this.note});
  final NoteModel note ;

  @override
  State<EditColorsList> createState() => _EditColorsListState();
}

class _EditColorsListState extends State<EditColorsList> {
  int currentIndex=0 ;
  @override
  void initState() {
    currentIndex = kColorsList.indexOf(widget.note.color);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex= index;
              widget.note.color = kColorsList[index];
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