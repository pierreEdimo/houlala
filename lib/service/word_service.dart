import 'package:flutter/cupertino.dart';

class WordService extends ChangeNotifier {

  late  String? _searchWord = "";

  String? getSearchWord(){
    return _searchWord;
  }

  void setSearchWord(String searchword){
    _searchWord = searchword;
    notifyListeners();
  }
  
}