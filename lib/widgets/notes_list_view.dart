import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes??[] ;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                print("notes = ${Hive.box<NoteModel>(kNotesBox).values.length}");
                return NoteItem(note: notes[index],);
              },
            ),
          ),
        );
      },
    );
  }
}
