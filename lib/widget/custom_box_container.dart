import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBoxContainer extends StatelessWidget {
  final Widget? child;
  final String? title;
  final String? urlValue;
  final Object? arguments;

  const CustomBoxContainer(
      {Key? key, this.child, this.title, this.urlValue, this.arguments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 9.5),
              child: Text(
                title!,
                style: GoogleFonts.poppins(
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
      ),
    );
  }
}
