import 'package:flutter_riverpod/flutter_riverpod.dart';

final wordStateNotifierProvider = 
    StateNotifierProvider<WordStateNotifier, String?>((ref) {
  return WordStateNotifier();
});

class WordStateNotifier extends StateNotifier<String?> {
  WordStateNotifier() : super("");

  void setWord(String word) {
    state = word; 
  }
}