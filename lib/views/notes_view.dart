import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) {
            return const AddNoteBottomSheet();
          },);
        },
        backgroundColor: Color.fromARGB(255, 67, 60, 43).withOpacity(0.9),
        child: const Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}
