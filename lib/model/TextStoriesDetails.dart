class TextStoriesDetails {
  String? id;
  String? title;
  String? textStories;
  String? image;
  String? thumbImage;

  TextStoriesDetails(
      {this.id, this.title, this.textStories, this.image, this.thumbImage});

  TextStoriesDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    textStories = json["text_stories"];
    image = json["image"];
    thumbImage = json["thumb_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["text_stories"] = textStories;
    _data["image"] = image;
    _data["thumb_image"] = thumbImage;
    return _data;
  }

  static List<TextStoriesDetails>? ofTextStoriesDetails(List ofData) {
    return ofData.map((e) => TextStoriesDetails.fromJson(e)).toList();
  }
}
