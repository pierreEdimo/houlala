
class ParameterFav {
  final String? id;
  final String? userId;

  ParameterFav({this.id, this.userId});

  factory ParameterFav.fromJson(Map<String ,dynamic> json) => ParameterFav(
    id: json["id"] as String,
    userId: json["userId"] as String,
  );

  Map<String, dynamic> toJson() => {
    "id":id,
    "userId": userId
  };
}
