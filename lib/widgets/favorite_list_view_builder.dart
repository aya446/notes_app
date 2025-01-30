import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/widgets/note_item.dart';


class FavoriteListViewBuilder extends StatelessWidget {
  const FavoriteListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        // نتأكد أن `favoriteNotes` ليست null
        final favoriteNotes =
            BlocProvider.of<NotesCubit>(context).favoriteNotes ?? [];
        if (favoriteNotes.isEmpty) {
          return const Center(
            child: Text(
              'No favorite notes available',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        }
    
        return Expanded(
          child: ListView.builder(
            itemCount: favoriteNotes.length,
            itemBuilder: (context, index) {
              return NoteItem(note: favoriteNotes[index]);
            },
          ),
        );
      },
    );
  }
}



