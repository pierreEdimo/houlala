import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/model/add_comment.dart';
import 'package:houlala/model/comment.dart';
import 'package:houlala/model/edit_comment.dart';
import 'package:http/http.dart';

import '../main.dart';
import '../model/additional_info.dart';

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

  Future<AdditionalPostInfo> getAdditionalInfo(String id) async {
    var userId = await storage.read(key: "userId");

    var url = Uri.parse(
        '${dotenv.env['POST_URL']}/additionalInfo/$id?userId=$userId');

    Response response = await get(url);

    if (response.statusCode == 200) {
      return AdditionalPostInfo.fromJson(jsonDecode(response.body));
    } else {
      throw "Error";
    }
  }

  Future<void> deleteComment(String postId, String commentId) async {
    var url = Uri.parse(
        '${dotenv.env['POST_URL']}/deleteComment/$postId?commentId=$commentId');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    await patch(
      url,
      headers: headers,
    );
    notifyListeners();
  }

  Future<void> editComment(
      String postId, String commentId, EditComment comment) async {
    String jsEncode = jsonEncode(comment);
    Map<String, String> headers = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        '${dotenv.env['POST_URL']}/editCommentFromPost/$postId?commentId=$commentId');
    await patch(
      url,
      headers: headers,
      body: jsEncode,
    );

    notifyListeners();
  }
}
