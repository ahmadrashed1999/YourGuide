// ignore_for_file: prefer_collection_literals

class PostModel {
  String? specialty;
  String? img;
  int? comments;
  String? fullName;
  String? postId;
  String? post;
  String? university;
  int? time;
  String? id;
  int? likesNum;
  Likes? likes;

  PostModel(
      {this.specialty,
      this.img,
      this.comments,
      this.fullName,
      this.postId,
      this.post,
      this.university,
      this.time,
      this.id,
      this.likesNum,
      this.likes});

  PostModel.fromJson(Map<String, dynamic> json) {
    specialty = json['specialty'];
    img = json['img'];
    comments = json['comments'];
    fullName = json['full_name'];
    postId = json['post_id'];
    post = json['post'];
    university = json['university'];
    time = json['time'];
    id = json['id'];
    likesNum = json['likes_num'];
    likes = json['likes'] != null ?  Likes.fromJson(json['likes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['specialty'] = specialty;
    data['img'] = img;
    data['comments'] = comments;
    data['full_name'] = fullName;
    data['post_id'] = postId;
    data['post'] = post;
    data['university'] = university;
    data['time'] = time;
    data['id'] = id;
    data['likes_num'] = likesNum;
    if (likes != null) {
      data['likes'] = likes!.toJson();
    }
    return data;
  }
}

class Likes {
  Name? name;

  Likes({this.name});

  Likes.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ?  Name.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (name != null) {
      data['name'] = name!.toJson();
    }
    return data;
  }
}

class Name {
  String? postId;
  String? id;
  int? time;

  Name({this.postId, this.id, this.time});

  Name.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    id = json['id'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['post_id'] = postId;
    data['id'] = id;
    data['time'] = time;
    return data;
  }
}
