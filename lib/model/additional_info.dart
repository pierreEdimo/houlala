class AdditionalPostInfo {
  final int? commentCount;
  final int? likeCount;
  bool? isLiked;

  AdditionalPostInfo({
    this.commentCount,
    this.isLiked,
    this.likeCount,
  });

  factory AdditionalPostInfo.fromJson(Map<String, dynamic> json) =>
      AdditionalPostInfo(
          commentCount: json['commentCount'] as int,
          likeCount: json['likeCount'] as int,
          isLiked: json['isLiked'] as bool);
}
