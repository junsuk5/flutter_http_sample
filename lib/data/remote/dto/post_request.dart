class PostRequest {
  PostRequest({
    required this.userId,
    required this.title,
    required this.body,
  });

  late final int userId;
  late final String title;
  late final String body;

  PostRequest.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['title'] = title;
    _data['body'] = body;
    return _data;
  }
}
