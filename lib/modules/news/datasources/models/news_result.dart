import 'dart:convert';

class NewsRootResult {
  final List<NewsResult> news;

  NewsRootResult(this.news);

  Map<String, dynamic> toMap() {
    return {
      'news': news?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory NewsRootResult.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return NewsRootResult(
      List<NewsResult>.from(map['news']?.map((x) => NewsResult.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsRootResult.fromJson(String source) =>
      NewsRootResult.fromMap(json.decode(source));
}

class NewsResult {
  final NewsUserResult user;
  final NewsMessageResult message;

  NewsResult(this.user, this.message);

  Map<String, dynamic> toMap() {
    return {
      'user': user?.toMap(),
      'message': message?.toMap(),
    };
  }

  factory NewsResult.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return NewsResult(
      NewsUserResult.fromMap(map['user']),
      NewsMessageResult.fromMap(map['message']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsResult.fromJson(String source) =>
      NewsResult.fromMap(json.decode(source));
}

class NewsUserResult {
  final String name;
  final String profilePicture;

  NewsUserResult(this.name, this.profilePicture);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'profile_picture': profilePicture,
    };
  }

  factory NewsUserResult.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return NewsUserResult(
      map['name'],
      map['profile_picture'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsUserResult.fromJson(String source) =>
      NewsUserResult.fromMap(json.decode(source));
}

class NewsMessageResult {
  final String content;
  final DateTime createdAt;

  NewsMessageResult(this.content, this.createdAt);

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory NewsMessageResult.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return NewsMessageResult(
      map['content'],
      DateTime.parse(map['created_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsMessageResult.fromJson(String source) =>
      NewsMessageResult.fromMap(json.decode(source));
}
