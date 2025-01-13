import 'package:flutter/material.dart';
import 'package:notes_app/widgets/note_item.dart';


class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
       itemCount: 8, 
        itemBuilder: (context, index) {
          return NoteItem();
        },
      ),
    );
  }
}
