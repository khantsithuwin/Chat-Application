class MessageModel {
  MessageModel({this.status, this.message, this.data});

  MessageModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(MessageData.fromJson(v));
      });
    }
  }

  bool? status;
  String? message;
  List<MessageData>? data;

  MessageModel copyWith({
    bool? status,
    String? message,
    List<MessageData>? data,
  }) => MessageModel(
    status: status ?? this.status,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class MessageData {
  MessageData({
    this.id,
    this.sender,
    this.content,
    this.type,
    this.chat,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  MessageData.fromJson(dynamic json) {
    id = json['_id'];
    sender = json['sender'] != null
        ? MessageSender.fromJson(json['sender'])
        : null;
    content = json['content'];
    type = json['type'];
    chat = json['chat'] != null ? Chat.fromJson(json['chat']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  MessageSender? sender;
  String? content;
  String? type;
  Chat? chat;
  String? createdAt;
  String? updatedAt;
  num? v;

  MessageData copyWith({
    String? id,
    MessageSender? sender,
    String? content,
    String? type,
    Chat? chat,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => MessageData(
    id: id ?? this.id,
    sender: sender ?? this.sender,
    content: content ?? this.content,
    type: type ?? this.type,
    chat: chat ?? this.chat,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    v: v ?? this.v,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (sender != null) {
      map['sender'] = sender?.toJson();
    }
    map['content'] = content;
    map['type'] = type;
    if (chat != null) {
      map['chat'] = chat?.toJson();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}

class Chat {
  Chat({
    this.id,
    this.users,
    this.latestMessage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Chat.fromJson(dynamic json) {
    id = json['_id'];
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users?.add(MessageUsers.fromJson(v));
      });
    }
    latestMessage = json['latest_message'] != null
        ? LatestMessage.fromJson(json['latest_message'])
        : null;

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  List<MessageUsers>? users;
  LatestMessage? latestMessage;
  String? createdAt;
  String? updatedAt;
  num? v;

  Chat copyWith({
    String? id,
    List<MessageUsers>? users,
    LatestMessage? latestMessage,
    dynamic groupName,
    bool? isGroupChat,
    List<dynamic>? groupAdmins,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => Chat(
    id: id ?? this.id,
    users: users ?? this.users,
    latestMessage: latestMessage ?? this.latestMessage,
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
    if (latestMessage != null) {
      map['latest_message'] = latestMessage?.toJson();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}

class LatestMessage {
  LatestMessage({
    this.id,
    this.sender,
    this.content,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  LatestMessage.fromJson(dynamic json) {
    id = json['_id'];
    sender = json['sender'] != null
        ? MessageSender.fromJson(json['sender'])
        : null;
    content = json['content'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  MessageSender? sender;
  String? content;
  String? type;
  String? createdAt;
  String? updatedAt;
  num? v;

  LatestMessage copyWith({
    String? id,
    MessageSender? sender,
    String? content,
    String? type,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => LatestMessage(
    id: id ?? this.id,
    sender: sender ?? this.sender,
    content: content ?? this.content,
    type: type ?? this.type,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    v: v ?? this.v,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (sender != null) {
      map['sender'] = sender?.toJson();
    }
    map['content'] = content;
    map['type'] = type;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}

class MessageSender {
  MessageSender({
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

  MessageSender.fromJson(dynamic json) {
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

  MessageSender copyWith({
    String? id,
    String? name,
    dynamic cover,
    String? email,
    bool? isVerified,
    bool? isBanned,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => MessageSender(
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

class MessageUsers {
  MessageUsers({
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

  MessageUsers.fromJson(dynamic json) {
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

  MessageUsers copyWith({
    String? id,
    String? name,
    dynamic cover,
    String? email,
    bool? isVerified,
    bool? isBanned,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => MessageUsers(
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
