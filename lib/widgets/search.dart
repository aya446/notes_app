import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/widgets/custom_search_icon.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
  });

  final String title;
  final IconData icon;
  final void Function()? onPressed;

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        customTexyField(),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CustomIcon(
            icon: widget.icon,
          ),
        )
      ],
    );
  }

  Expanded customTexyField() {
    return Expanded(
      child: TextField(
        controller: searchController,
        autofocus: true,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              top: 15.0,
              bottom: 15,
              left: 20,
            ),
            hintText: 'Search...',
            hintStyle: const TextStyle(color: Colors.white),
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder()),
        onChanged: (value) {
          BlocProvider.of<NotesCubit>(context).searchNotes(value);
          if (value.isEmpty) {
            BlocProvider.of<NotesCubit>(context).searchNotes('');
          }
        },
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
