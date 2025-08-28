import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  String name;
  String email;
  bool online;
  String uid;

  Usuario({
    required this.name,
    required this.email,
    required this.online,
    required this.uid,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    name: json["name"],
    email: json["email"],
    online: json["online"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "online": online,
    "uid": uid,
  };
}