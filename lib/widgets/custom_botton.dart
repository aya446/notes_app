import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';


class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, this.onTap, required this.isLoading});

  final bool isLoading ;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child:  Center(
          child:  isLoading ? const CircularProgressIndicator(
            color: Color.fromARGB(255, 62, 61, 61),
          ): const Text(
            'Add',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
