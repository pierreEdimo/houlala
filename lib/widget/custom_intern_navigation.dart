import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInternNavigation extends StatefulWidget {
  final List<String>? menuItems;
  final List<Widget>? widgetOptions;
  final double? elevationValue;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? height;

  const CustomInternNavigation(
      {Key? key,
      this.menuItems,
      this.widgetOptions,
      this.elevationValue,
      this.verticalPadding,
      this.horizontalPadding,
      this.height})
      : super(key: key);

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
              height: 60,
              child: Container(
                alignment: Alignment.centerLeft,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
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
                      child: Container(
                        width: 120,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: _isSelected
                                ? const BorderSide(
                                    color: Colors.orangeAccent, width: 2.0)
                                : const BorderSide(
                                    color: Colors.transparent,
                                  ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            menu,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _isSelected
                                    ? Colors.orangeAccent
                                    : Colors.black,
                              )
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
          widget.widgetOptions!.elementAt(_currentIndex),
        ],
      ),
    );
  }
}
