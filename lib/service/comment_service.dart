import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/model/add_comment.dart';
import 'package:houlala/model/comment.dart';
import 'package:http/http.dart';

class CommentService extends ChangeNotifier {
  Future<List<Comment>> fetchAllCategories(String uri) async {
    var url = Uri.parse(uri);
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Comment> comments =
          body.map((dynamic comment) => Comment.fromJson(comment)).toList();
      return comments;
    } else {
      throw "No Categories";
    }
  }

  Future<void> addComment(AddComment comment) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsEncode;
    jsEncode = jsonEncode(comment);
    var url =
        Uri.parse('${dotenv.env['POST_URL']}/addComment/${comment.postId}');
    await patch(
      url,
      headers: headers,
      body: jsEncode,
    );
    notifyListeners();
  }

  Future<int> getCommentCount(String? postId) async {
    var url = Uri.parse('${dotenv.env['POST_URL']}/getCommentCount/$postId');

    Response response = await get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw "No Product found";
    }
  }
}
