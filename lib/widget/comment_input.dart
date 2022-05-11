import 'package:flutter/material.dart';

class CommentInput extends StatelessWidget {
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;

  const CommentInput({
    Key? key,
    this.controller,
    this.maxLines,
    this.minLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          hintText: "ajouter un commentaire"),
    );
  }
}
