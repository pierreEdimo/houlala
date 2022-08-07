import 'package:flutter/material.dart';
import 'package:houlala/service/word_service.dart';
import 'package:houlala/widget/search_app_bar.dart';
import 'package:houlala/widget/search_result_container.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController? _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String? searchWord =
        Provider.of<WordService>(context).getSearchWord();

    return Scaffold(
      appBar: SearchAppBar(
        controller: _controller!,
      ),
      body: searchWord!.isEmpty
          ? Container()
          : SearchResultContainer(
              searchword: searchWord.trim(),
            ),
    );
  }
}
