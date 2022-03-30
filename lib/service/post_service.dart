import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:houlala/model/post.dart';
import 'package:http/http.dart';

class PostService extends ChangeNotifier{

  Future<List<Post>> fetchPosts(String uri) async {
    var url = Uri.parse(uri);
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Post> posts =
      body.map((dynamic post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      throw "No Posts";
    }
  }

  Future<Post> fetchSinglePost(String uri) async {
    var url = Uri.parse(uri);

    Response response = await get(url);

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw "No Post found";
    }
  }
}