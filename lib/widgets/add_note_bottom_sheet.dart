import 'package:flutter/material.dart';
import 'package:notes_app/widgets/costum_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          CostumTextField(
            hint: 'Title',
          ),
          SizedBox(
            height: 16,
          ),
          CostumTextField(
            hint: "Content",
            maxLinse: 5,
          )
        ],
      ),
    );
  }
}
