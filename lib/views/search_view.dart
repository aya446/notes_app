import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_list_view.dart';
import 'package:notes_app/widgets/search.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            SearchAppBar(title: 'Search..', icon: Icons.search),
            NotesListView()
          ],
        ),
      ),
    );
  }
}
