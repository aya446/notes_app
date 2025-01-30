import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  List<NoteModel>? filteredNotes;
  List<NoteModel>? favoriteNotes;
  fetchAllNotes() async {
    var box = await Hive.openBox<NoteModel>(kNotesBox);
    notes = box.values.toList().reversed.toList();
    filteredNotes = notes;
    emit(NotesSuccess());
  }

  searchNotes(String value) {
    if (value.isEmpty) {
      filteredNotes = notes;
    } else {
      filteredNotes = notes?.where((note) {
        return note.title.toLowerCase().contains(value.toLowerCase()) ||
            note.subtitle.toLowerCase().contains(value.toLowerCase());
      }).toList();
      emit(NotesSuccess());
    }
  }

   toggleFavorite(NoteModel note) {
    favoriteNotes ??= [];
    if (favoriteNotes!.contains(note)) {
      favoriteNotes!.remove(note); 
    } else {
      favoriteNotes!.add(note);
    }

    emit(NotesFavoritesUpdated(favoriteNotes: favoriteNotes!));
  }
}
