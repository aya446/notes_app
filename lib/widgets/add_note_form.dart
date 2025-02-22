import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/costum_text_field.dart';
import 'package:notes_app/widgets/custom_botton.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> FormKey = GlobalKey();
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: FormKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            CostumTextField(
              onSaved: (value) {
                title = value;
              },
              hint: 'Title',
            ),
            const SizedBox(
              height: 16,
            ),
            CostumTextField(
              hint: "Content",
              maxLinse: 5,
              onSaved: (value) {
                subtitle = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const ColorsListview(),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomBotton(
                  isLoading: state is AddNoteLoading ? true : false ,
                  onTap: () {
                    if (FormKey.currentState!.validate()) {
                      FormKey.currentState!.save();
                      var currentDate = DateTime.now();
                      var formatedCurrentDate = DateFormat('dd-mm-yyyy').format(currentDate);
                      var noteModel = NoteModel(
                          title: title!,
                          subtitle: subtitle!,
                          date: formatedCurrentDate,
                          color: Colors.brown.value);
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


