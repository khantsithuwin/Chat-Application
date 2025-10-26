class CreateChatModel {
  CreateChatModel({this.status, this.message, this.data});

  CreateChatModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? CreateChatData.fromJson(json['data']) : null;
  }

  bool? status;
  String? message;
  CreateChatData? data;

  CreateChatModel copyWith({
    bool? status,
    String? message,
    CreateChatData? data,
  }) => CreateChatModel(
    status: status ?? this.status,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class CreateChatData {
  CreateChatData({
    this.id,
    this.users,
    this.latestMessage,
    this.groupName,
    this.isGroupChat,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  CreateChatData.fromJson(dynamic json) {
    id = json['_id'];
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users?.add(Users.fromJson(v));
      });
    }
    latestMessage = json['latest_message'];
    groupName = json['group_name'];
    isGroupChat = json['is_group_chat'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  List<Users>? users;
  dynamic latestMessage;
  dynamic groupName;
  bool? isGroupChat;
  List<dynamic>? groupAdmins;
  String? createdAt;
  String? updatedAt;
  num? v;

  CreateChatData copyWith({
    String? id,
    List<Users>? users,
    dynamic latestMessage,
    dynamic groupName,
    bool? isGroupChat,
    List<dynamic>? groupAdmins,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => CreateChatData(
    id: id ?? this.id,
    users: users ?? this.users,
    latestMessage: latestMessage ?? this.latestMessage,
    groupName: groupName ?? this.groupName,
    isGroupChat: isGroupChat ?? this.isGroupChat,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    v: v ?? this.v,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (users != null) {
      map['users'] = users?.map((v) => v.toJson()).toList();
    }
    map['latest_message'] = latestMessage;
    map['group_name'] = groupName;
    map['is_group_chat'] = isGroupChat;
    if (groupAdmins != null) {
      map['group_admins'] = groupAdmins?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}

class Users {
  Users({
    this.id,
    this.name,
    this.cover,
    this.email,
    this.isVerified,
    this.isBanned,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Users.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    cover = json['cover'];
    email = json['email'];
    isVerified = json['is_verified'];
    isBanned = json['is_banned'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  String? name;
  dynamic cover;
  String? email;
  bool? isVerified;
  bool? isBanned;
  String? createdAt;
  String? updatedAt;
  num? v;

  Users copyWith({
    String? id,
    String? name,
    dynamic cover,
    String? email,
    bool? isVerified,
    bool? isBanned,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => Users(
    id: id ?? this.id,
    name: name ?? this.name,
    cover: cover ?? this.cover,
    email: email ?? this.email,
    isVerified: isVerified ?? this.isVerified,
    isBanned: isBanned ?? this.isBanned,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    v: v ?? this.v,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['cover'] = cover;
    map['email'] = email;
    map['is_verified'] = isVerified;
    map['is_banned'] = isBanned;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
