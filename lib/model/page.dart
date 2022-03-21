class PageModel {
  final String? id;
  final String? name;
  final String? imageUrl;
  final String? email;
  final String? telephoneNumber;
  final bool? isVerified;
  final int? companySize;
  final String? headQuartersCountry;
  final String? headQuartersCity;
  final String? pageSpecialisation;
  final String? description;

  PageModel(
      {this.name,
      this.imageUrl,
      this.id,
      this.email,
      this.telephoneNumber,
      this.isVerified,
      this.headQuartersCountry,
      this.headQuartersCity,
      this.pageSpecialisation,
      this.description,
      this.companySize});

  factory PageModel.fromJson(Map<String, dynamic> json) => PageModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      email: json['email'] as String,
      headQuartersCountry: json['headQuarters_country'] as String,
      headQuartersCity: json['headQuarters_city'] as String,
      pageSpecialisation: json['page_specialisation'] as String,
      isVerified: json['isVerifed'] as bool,
      companySize: json['companySize'] as int,
      description: json['description'] as String,
      telephoneNumber: json['telephoneNumber'] as String);
}
