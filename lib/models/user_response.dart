import 'dart:convert';

import 'package:chat_app/models/usuario.dart';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  bool ok;
  List<Usuario> msg;

  UserResponse({
    required this.ok,
    required this.msg,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    ok: json["ok"],
    msg: List<Usuario>.from(json["msg"].map((x) => Usuario.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "msg": List<dynamic>.from(msg.map((x) => x.toJson())),
  };
}
