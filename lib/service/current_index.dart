import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentIndexProvider =
    StateNotifierProvider<CurrentIndex, int>((ref) => CurrentIndex());

class CurrentIndex extends StateNotifier<int> {
  CurrentIndex() : super(0);

  void setCurrentIndex(int index) {
    state = index;
  }
}
