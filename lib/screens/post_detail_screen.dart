import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/widget/app_bar_with_return.dart';
import 'package:houlala/widget/post_detail_container.dart';

class PostDetailScreen extends StatelessWidget {
  static const routeName = "/post_detail";
  final TextEditingController _controller = TextEditingController();

  PostDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBarWithReturn(
        elevation: 1,
        title: "",
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                child: PostDetailContainer(
                  uri: '${dotenv.env['POST_URL']}/$id',
                ),
              ),
            ),
          ),
          Material(
            elevation: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        color: const Color(0xf2f2f2f2),
                        child: TextFormField(
                          controller: _controller,
                          minLines: 1,
                          maxLines: 3,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 10.0),
                              hintText: "ajouter un commentaire"),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          if (kDebugMode) {
                            print(_controller.text);
                            print(id);
                          }
                        },
                        icon: const FaIcon(FontAwesomeIcons.paperPlane))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
