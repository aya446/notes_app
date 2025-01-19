import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubitCubit extends Cubit<AddNoteState> {
  AddNoteCubitCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async {
    emit(AddNoteLoading());

    try {
      var NotesBox = Hive.box(kNotesBox);
      emit(AddNoteSuccess());
      await NotesBox.add(note);
    } on Exception catch (e) {
      emit(AddNoteFailure(errMessage: e.toString()));
    }
  }
}
