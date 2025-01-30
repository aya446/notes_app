import 'package:flutter/material.dart';
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
  
  String? searchTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          isSearching
              ? customTexyField()
              : Expanded(
                  child: Row(
                    children: [
                      Text(
                        widget.title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CustomIcon(
              icon: widget.icon,
              onPressed: () {
                if (isSearching) {
                  setState(() {
                    isSearching = false; 
                    searchController.clear(); 
                  });
                } else {
                  setState(() {
                    isSearching = true;
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Expanded customTexyField() {
    return Expanded(
      child: TextField(
        controller: searchController,
        autofocus: true,
        style: const TextStyle(color: Colors.black),
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
           searchTitle = value ;
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


