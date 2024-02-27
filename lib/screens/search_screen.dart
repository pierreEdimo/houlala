import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/service/word_service.dart';
import 'package:houlala/widget/custom_button_container.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String? searchWord =
        Provider.of<WordService>(context).getSearchWord();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomButtonContainer(
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: TextFormField(
          controller: controller,
          textInputAction: TextInputAction.search,
          onFieldSubmitted: (value) {
            Provider.of<WordService>(context, listen: false)
                .setSearchWord(controller.text);
          },
          decoration: InputDecoration(
            hintText: "Rechercher",
            border: InputBorder.none,
            hintStyle: const TextStyle(
              color: Color(0xff000000),
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xff000000),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                controller.clear();
                Provider.of<WordService>(context, listen: false)
                    .setSearchWord(controller.text);
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ),
      ),
      body: searchWord!.isEmpty
          ? Container()
          : const Center(
              child: Text("search result"),
            ),
    );
  }
}

class SearchResultContainer extends StatelessWidget {
  const SearchResultContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
