import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WebAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String? title;

  WebAppBar({
    this.title,
    Key? key,
  })  : preferredSize = const Size.fromHeight(70.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        color: const Color(0xf2f2f2f2),
        child: Row(
          children: [
            const Spacer(),
            Flexible(
              flex: 3,
              child: Center(
                child: Row(
                  children: const [
                    Text("houlala")
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
