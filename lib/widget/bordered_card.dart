import 'package:flutter/material.dart';

class BorderedCard extends StatelessWidget {
  final Widget? child;

  const BorderedCard({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          4.0,
        ),
        side: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: child!,
      ),
    );
  }
}
