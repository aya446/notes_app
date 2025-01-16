import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';

class EditViewBOdy extends StatelessWidget {
  const EditViewBOdy({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 50,),
          CustomAppBar(title: 'Edit' , icon: Icons.check),
        ],
      ),
    );
  }
}