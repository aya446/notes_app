part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

class NotesInitial extends NotesState {}

class NotesSuccess extends NotesState {}

class NotesFavoritesUpdated extends NotesState {
  final List<NoteModel> favoriteNotes;

  NotesFavoritesUpdated({required this.favoriteNotes});
}

