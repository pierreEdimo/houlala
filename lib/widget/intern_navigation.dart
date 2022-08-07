import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InternNavigation extends StatefulWidget {
  final List<String>? menuItems;
  final List<Widget>? children;
  final double? elevationValue;

  const InternNavigation({
    Key? key,
    this.menuItems,
    this.children,
    this.elevationValue,

  }) : super(key: key);

  @override
  State<InternNavigation> createState() => _InternNavigationState();
}

class _InternNavigationState extends State<InternNavigation> {
  late bool _isSelected;
  late int _currentIndex = 0;
  late int index = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Material(
            elevation: widget.elevationValue!,
            color: const Color(0xffffffff),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 100.w,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: widget.menuItems!.map(
                    (childWidget) {
                      _isSelected =
                          _currentIndex == widget.menuItems!.indexOf(childWidget);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex =
                                widget.menuItems!.indexOf(childWidget);
                          });
                        },
                        child: Text(
                          childWidget,
                          style: TextStyle(
                            fontFamily: "PoppinsBold",
                            fontSize: _isSelected ? 22 : 17,
                            color: _isSelected
                                ? const Color(0xffdf972f)
                                : Colors.black,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
          widget.children!.elementAt(_currentIndex),
        ],
      ),
    );
  }
}
