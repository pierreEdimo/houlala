import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houlala/main.dart';
import 'package:houlala/model/comment.dart';
import 'package:houlala/service/comment_service.dart';
import 'package:houlala/widget/comment_edit.dart';
import 'package:houlala/widget/custom_list_tile.dart';
import 'package:houlala/widget/report_tile.dart';
import 'package:houlala/widget/show_nack.dart';
import 'package:houlala/widget/standard_custom_container.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CommentModelBody extends StatelessWidget {
  final Comment? comment;

  const CommentModelBody({
    Key? key,
    this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        String? userId = "";

        if(!kIsWeb){
          userId = await storage.read(key: "userId");
        } else {
          userId = userIdBox.get("userId");
        }


        showMaterialModalBottomSheet(
          context: context,
          expand: false,
          builder: (context) => StandardCustomContainer(
            child: userId == comment!.author!.id!
                ? SizedBox(
                    height: 18.5.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: CommentEdit(
                            comment: comment!,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: InkWell(
                              onTap: () async {
                                Navigator.of(context).pop();

                                await Provider.of<CommentService>(context,
                                        listen: false)
                                    .deleteComment(
                                        comment!.postId!, comment!.id!);

                                showSnack(
                                    const Text(
                                        "Votre Commentaire a ete supprime avec succes"),
                                    context);
                              },
                              child: const CustomListTile(
                                leadingIcon: FontAwesomeIcons.trashCan,
                                title: "supprimer",
                                icon: Text(""),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const ReportTile(),
          ),
        );
      },
      child: const FaIcon(FontAwesomeIcons.ellipsisVertical),
    );
  }
}
