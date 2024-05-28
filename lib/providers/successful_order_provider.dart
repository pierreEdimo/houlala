import 'package:flutter_riverpod/flutter_riverpod.dart';

final successOrderProvider =
    StateNotifierProvider<SuccessOrder, bool>((ref) => SuccessOrder());

class SuccessOrder extends StateNotifier<bool> {
  SuccessOrder() : super(false);

  void setAnOrderSuccessTrue() {
    state = false;
  }
}
