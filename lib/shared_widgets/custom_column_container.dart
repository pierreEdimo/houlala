import 'package:flutter/material.dart';

class CustomColumnContainer extends StatelessWidget {
  final Widget? title;
  final Widget? child;

  const CustomColumnContainer({super.key, this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 9.5),
              child: title!,
            ),
            child!
          ],
        ),
      ),
    );
  }
}
