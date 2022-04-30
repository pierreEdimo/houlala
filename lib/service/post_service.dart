import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:houlala/main.dart';
import 'package:houlala/model/found_post.dart';
import 'package:houlala/model/post.dart';
import 'package:http/http.dart';

class PostService extends ChangeNotifier {
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

  Future<FoundPost> fetchSinglePost(String id) async {
    String? userId = await storage.read(key: 'userId');

    var url = Uri.parse('${dotenv.env['POST_URL']}/$id?userId=$userId');

    Response response = await get(url);

    if (response.statusCode == 200) {
      return FoundPost.fromJson(jsonDecode(response.body));
    } else {
      throw "No Post found";
    }
  }

  Future<void> likePost(String id) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String? userId = await storage.read(key: "userId");

    var url =
        Uri.parse("${dotenv.env['POST_URL']}/likePost/$id?userId=$userId");
    await patch(
      url,
      headers: headers,
    );
    notifyListeners();
  }
}
