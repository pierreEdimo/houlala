import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/service/word_service.dart';
import 'package:houlala/widget/custom_button_container.dart';
import 'package:provider/provider.dart';

class SearchAppBar extends StatelessWidget with PreferredSizeWidget {
  final TextEditingController? controller;
  @override
  final Size preferredSize;

  const SearchAppBar({
    Key? key,
    this.controller,
  })  : preferredSize = const Size.fromHeight(70.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SafeArea(
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButtonContainer(
                  icon: const FaIcon(
                    FontAwesomeIcons.angleLeft,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    controller!.clear();
                    Provider.of<WordService>(context, listen: false)
                        .setSearchWord(controller!.text);
                  },
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: TextFormField(
                      controller: controller,
                      textInputAction: TextInputAction.search,
                      onFieldSubmitted: (value) {
                        if (kDebugMode) {
                          print(controller!.text);
                        }

                        Provider.of<WordService>(context, listen: false)
                            .setSearchWord(controller!.text);
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
                            controller!.clear();
                            Provider.of<WordService>(context, listen: false)
                                .setSearchWord(controller!.text);
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
