import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';


class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:  Text(
        note.title,
        style: const TextStyle(color: Colors.black, fontSize: 26),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          note.subtitle,
          style: TextStyle(
              color: Colors.black.withOpacity(0.5), fontSize: 20),
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          BlocProvider.of<NotesCubit>(context).toggleFavorite(note);
        },
        icon: BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            bool isFavorite = (BlocProvider.of<NotesCubit>(context)
                .favoriteNotes?? [])
                .contains(note);
            return Icon(
              isFavorite
                  ? FontAwesomeIcons.solidHeart 
                  : FontAwesomeIcons.heart,
              color: Colors.black,    
              size: 24,
            );
          },
        ),
      ),
    );
  }
}
