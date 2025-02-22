import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon, this.onPressed});
  final String title ;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Text(title , style: const TextStyle(color: Colors.white, fontSize: 25 ),),
          const Spacer(),
          CustomIcon(icon: icon , onPressed: onPressed),
        ],
      ),
    );
  }
}


