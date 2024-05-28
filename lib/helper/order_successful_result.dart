import 'package:flutter/cupertino.dart';

class OrderSuccesfulResult{
  static ValueNotifier<bool> isSuccessResult = ValueNotifier(false);

  static void setSussssTrue(){
    isSuccessResult.value = true;
  }
}