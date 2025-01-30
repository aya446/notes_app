import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/custom_list_tile.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note,});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(note.subtitle),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        note.delete();
        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
      },
      background: Container(
        color: Colors.red, 
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(
          FontAwesomeIcons.trash,
          color: Colors.white,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return  EditNoteView(note: note,);
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Color(note.color),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24, top: 24, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomListTile(note: note),
                  Padding(
                    padding: const EdgeInsets.only(right: 24, top: 16),
                    child: Text(
                      note.date,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
