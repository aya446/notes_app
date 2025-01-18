import 'package:flutter/material.dart';
import 'package:notes_app/widgets/costum_text_field.dart';
import 'package:notes_app/widgets/custom_botton.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 480,
        child: AddNoteForm(),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  AutovalidateMode autovalidateMode =AutovalidateMode.disabled;

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
                subtitle = value ;
              },
            ),
            const SizedBox(
              height: 130,
            ),
            CustomBotton(
              onTap: () {
                if(FormKey.currentState!.validate()){
                  FormKey.currentState!.save();
                }else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {
                    
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
