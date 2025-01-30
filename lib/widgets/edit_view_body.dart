import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/widgets/costum_text_field.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/edit_list_view.dart';

class EditViewBOdy extends StatefulWidget {
  const EditViewBOdy({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  State<EditViewBOdy> createState() => _EditViewBOdyState();
}

class _EditViewBOdyState extends State<EditViewBOdy> {
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(
              title: 'Edit',
              icon: Icons.check,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subtitle = subtitle ?? widget.note.subtitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(
              height: 50,
            ),
            CostumTextField(
              hint: widget.note.title,
              onchange: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CostumTextField(
              hint: widget.note.subtitle,
              maxLinse: 5,
              onchange: (value) {
                subtitle = value;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            EditColorsList(
              note: widget.note,
            )
          ],
        ),
      ),
    );
  }
}
