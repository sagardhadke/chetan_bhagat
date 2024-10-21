class VideoStories {
  String? id;
  String? title;
  String? videoUrl;

  VideoStories({this.id, this.title, this.videoUrl});

  VideoStories.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    videoUrl = json["video_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["video_url"] = videoUrl;
    return _data;
  }

  static List<VideoStories>? ofvideoStories(List ofData) {
    return ofData.map((e) => VideoStories.fromJson(e)).toList();
  }
}
