import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/widgets/note_item.dart';

class FavoriteNotesView extends StatelessWidget {
  const FavoriteNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Favorites",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            BlocBuilder<NotesCubit, NotesState>(
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
            ),
          ],
        ),
      ),
    );
  }
}



