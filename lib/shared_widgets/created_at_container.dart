import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreatedAtContainer extends StatelessWidget {
  final DateTime? createdAt;
  final double? fontSize;

  const CreatedAtContainer({
    super.key,
    this.createdAt,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.yMMMMEEEEd('fr').format(
        createdAt!,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize != null ? fontSize! : 12.0,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    );
  }
}
