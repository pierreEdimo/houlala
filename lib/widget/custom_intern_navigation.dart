import 'package:flutter/material.dart';

class CustomInternNavigation extends StatefulWidget {
  final List<String>? menuItems;
  final List<Widget>? widgetOptions;
  final double? elevationValue;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? height;

  const CustomInternNavigation({
    Key? key,
    this.menuItems,
    this.widgetOptions,
    this.elevationValue,
    this.verticalPadding,
    this.horizontalPadding,
    this.height
  }) : super(key: key);

  @override
  State<CustomInternNavigation> createState() => _CustomInternNavigationState();
}

class _CustomInternNavigationState extends State<CustomInternNavigation> {
  late bool _isSelected;
  late int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Material(
            elevation: widget.elevationValue!,
            color: const Color(0xffffffff),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: widget.horizontalPadding!),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.menuItems!.length,
                    itemBuilder: (BuildContext context, int index) {
                      String menu = widget.menuItems![index];
                      _isSelected = _currentIndex == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            child: Text(
                              menu,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: _isSelected ? 18 : 15,
                                color: _isSelected ? Colors.red : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          widget.widgetOptions!.elementAt(_currentIndex),

        ],
      ),
    );
  }
}
