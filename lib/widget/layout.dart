import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/service/current_index.dart';

import 'bottom_item.dart';

class Layout extends ConsumerWidget {
  final List<Widget>? children;
  final List<BottomItem>? bottomItems;
  final Color? selectedColor;
  final Color? unSelectedColor;

  const Layout({
    Key? key,
    this.children,
    this.bottomItems,
    this.selectedColor,
    this.unSelectedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late bool isSelected;
    int currentIndex = ref.watch(currentIndexProvider);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: width * 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: children!.elementAt(currentIndex),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 60,
              width: width * 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: bottomItems!
                    .asMap()
                    .map(
                      (index, item) {
                        isSelected = currentIndex == index;
                        return MapEntry(
                          index,
                          IconButton(
                            onPressed: () => ref
                                .read(currentIndexProvider.notifier)
                                .setCurrentIndex(index),
                            icon: BottomItem(
                              icon: item.icon,
                              selected: isSelected,
                              selectedIcon: item.selectedIcon,
                              color: isSelected
                                  ? selectedColor
                                  : unSelectedColor,
                            ),
                          ),
                        );
                      },
                    )
                    .values
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
