part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NotesSuccess extends NotesState {
  final List<NoteModel> note;
  NotesSuccess({required this.note}); 
}

class NotesFailure extends NotesState {
  final String errMessage;

  NotesFailure({required this.errMessage});
}

