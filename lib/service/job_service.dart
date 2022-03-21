import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:houlala/model/job.dart';
import 'package:http/http.dart';

class JobService extends ChangeNotifier {
  Future<List<Job>> fetchAllJobs(String uri) async {
    var url = Uri.parse(uri);
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Job> jobs = body.map((dynamic job) => Job.fromJson(job)).toList();
      return jobs;
    } else {
      throw "No Categories";
    }
  }

  Future<Job> fetchSingleProduct(String uri) async {
    var url = Uri.parse(uri);

    Response response = await get(url);

    if (response.statusCode == 200) {
      return Job.fromJson(jsonDecode(response.body));
    } else {
      throw "No Product found";
    }
  }
}
