class SendMessageModel {
  SendMessageModel({this.status, this.message, this.data});

  SendMessageModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? status;
  String? message;
  Data? data;

  SendMessageModel copyWith({bool? status, String? message, Data? data}) =>
      SendMessageModel(
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

class Data {
  Data({this.id, this.sender, this.content, this.createdAt});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    sender = json['sender'] != null ? Sender.fromJson(json['sender']) : null;
    content = json['content'];
    createdAt = json['createdAt'];
  }

  String? id;
  Sender? sender;
  String? content;
  String? createdAt;

  Data copyWith({
    String? id,
    Sender? sender,
    String? content,
    String? createdAt,
  }) => Data(
    id: id ?? this.id,
    sender: sender ?? this.sender,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (sender != null) {
      map['sender'] = sender?.toJson();
    }
    map['content'] = content;
    map['createdAt'] = createdAt;
    return map;
  }
}

class Sender {
  Sender({this.id, this.name, this.email});

  Sender.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
  }

  String? id;
  String? name;
  String? email;

  Sender copyWith({String? id, String? name, String? email}) => Sender(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['email'] = email;
    return map;
  }
}
