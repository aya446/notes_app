import 'package:flutter/material.dart';
import 'package:notes_app/widgets/favorite_list_view_builder.dart';

class FavoriteNotesView extends StatelessWidget {
  const FavoriteNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Favorites",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            FavoriteListViewBuilder(),
          ],
        ),
      ),
    );
  }
}
