import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreatedAtContainer extends StatelessWidget {
  final DateTime? createdAt;

  const CreatedAtContainer({
    Key? key,
    this.createdAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.yMMMMEEEEd('fr').format(
        createdAt!,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
        fontSize: 12.0,
      ),
    );
  }
}
