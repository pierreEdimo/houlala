import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houlala/shared_widgets/material_container.dart';

class CustomBoxContainer extends StatelessWidget {
  final Widget? child;
  final String? title;
  final String? urlValue;
  final Object? arguments;

  const CustomBoxContainer(
      {super.key, this.child, this.title, this.urlValue, this.arguments});

  @override
  Widget build(BuildContext context) {
    return MaterialContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9.5),
            child: Text(
              title!,
              style: GoogleFonts.jetBrainsMono(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18.0)),
            ),
          ),
          child!,
          Container(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () => Navigator.of(context).pushNamed(
                urlValue!,
                arguments: arguments,
              ),
              child: const Text("voir plus"),
            ),
          )
        ],
      ),
    );
  }
}
