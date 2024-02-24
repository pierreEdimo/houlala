import 'package:flutter/material.dart';

class CustomBoxContainer extends StatelessWidget {
  final Widget? child;
  final String? title;
  final String? urlValue;
  const CustomBoxContainer({
    Key? key,
    this.child,
    this.title,
    this.urlValue,
  }) : super(key: key);

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
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            child!,
            Container(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () => Navigator.of(context).pushNamed("/$urlValue"),
                child: const Text("voir plus"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
