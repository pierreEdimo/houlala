import 'package:flutter/material.dart';

class CustomColumnContainer extends StatelessWidget {
  final Widget? child;
  final Widget? gridList;

  const CustomColumnContainer({Key? key, this.child, this.gridList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        child!,
        const SizedBox(
          height: 8.0,
        ),
        Container(child: gridList!)
      ],
    );
  }
}
