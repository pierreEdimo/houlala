import 'package:houlala/model/populated_page.dart';

class Job {
  Job({
    this.id,
    this.page,
    this.jobTitel,
    this.jobDescription,
    this.jobLocationCity,
    this.jobLocationCountry,
    this.jobType,
    this.experienceLevel,
    this.jobFunction,
    this.jobOption,
  });

  final String? id;
  final PopulatedPage? page;
  final String? jobTitel;
  final String? jobDescription;
  final String? jobLocationCity;
  final String? jobLocationCountry;
  final String? jobType;
  final String? experienceLevel;
  final String? jobFunction;
  final String? jobOption;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["_id"],
    page: PopulatedPage.fromJson(json["page"]),
    jobTitel: json["jobTitel"],
    jobDescription: json["jobDescription"],
    jobLocationCity: json["jobLocation_city"],
    jobLocationCountry: json["jobLocation_country"],
    jobType: json["jobType"],
    experienceLevel: json["experienceLevel"],
    jobFunction: json["jobFunction"],
    jobOption: json["jobOption"],
  );
}