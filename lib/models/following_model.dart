class FollowingModel {
  String? type;
  int? id;
  String? playlist;
  String? flashcardFront;
  String? flashcardBack;
  String? description;
  UserBean? user;

  static FollowingModel fromMap(Map<String, dynamic> map) {
    FollowingModel followingModelBean = FollowingModel();
    followingModelBean.type = map['type']??'';
    followingModelBean.id = map['id']??0;
    followingModelBean.playlist = map['playlist']??'';
    followingModelBean.flashcardFront = map['flashcard_front']??'';
    followingModelBean.flashcardBack = map['flashcard_back']??'';
    followingModelBean.description = map['description']??'';
    followingModelBean.user = UserBean.fromMap(map['user']??{});
    return followingModelBean;
  }

  Map toJson() => {
    "type": type,
    "id": id,
    "playlist": playlist,
    "flashcard_front": flashcardFront,
    "flashcard_back": flashcardBack,
    "description": description,
    "user": user,
  };
}

/// name : "AP US History"
/// avatar : "http://cross-platform-rwa.s3-website-us-east-1.amazonaws.com/avatars/apush.png"

class UserBean {
  String? name;
  String? avatar;

  static UserBean fromMap(Map<String, dynamic> map) {
    UserBean userBean = UserBean();
    userBean.name = map['name']??'';
    userBean.avatar = map['avatar']??'';
    return userBean;
  }

  Map toJson() => {
    "name": name,
    "avatar": avatar,
  };
}