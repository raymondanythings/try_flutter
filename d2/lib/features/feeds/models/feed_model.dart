class FeedModel {
  final String thread;
  final int replice;
  final int likes;
  final String creatorUid;
  final String creator;
  final int createdAt;
  final List<String> imageList;
  final List<String> keywords;

  const FeedModel({
    required this.thread,
    required this.replice,
    required this.likes,
    required this.creatorUid,
    required this.creator,
    required this.createdAt,
    this.imageList = const [],
    this.keywords = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      "thread": thread,
      "replice": replice,
      "likes": likes,
      "creatorUid": creatorUid,
      "creator": creator,
      "createdAt": createdAt,
      "imageList": imageList,
      "keywords": keywords,
    };
  }

  FeedModel.fromJson(Map<String, dynamic> json)
      : thread = json["thread"],
        replice = json["replice"],
        likes = json["likes"],
        creatorUid = json["creatorUid"],
        creator = json["creator"],
        createdAt = json["createdAt"],
        imageList = List<String>.from(json["imageList"]),
        keywords = List<String>.from(json["keywords"]);
}
