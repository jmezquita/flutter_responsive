// To parse this JSON data, do
//
//     final email = emailFromJson(jsonString);

import 'dart:convert';

Email emailFromJson(String str) => Email.fromJson(json.decode(str));

String emailToJson(Email data) => json.encode(data.toJson());

class Email {
    Email({
        this.id=0,
        this.subject='',
        this.fecha='',
        this.sender='',
        this.senderemail='',
        this.mensaje='',
        this.isread=false,
        this.photo='',
        this.emailcc='',
    });

    int id;
    String subject;
    String fecha;
    String sender;
    String senderemail;
    String mensaje;
    bool isread;
    String photo;
    String emailcc;

    factory Email.fromJson(Map<String, dynamic> json) => Email(
        id: json["id"],
        subject: json["subject"],
        fecha: json["fecha"],
        sender: json["sender"],
        senderemail: json["senderemail"],
        mensaje: json["mensaje"],
        isread: json["isread"],
        photo: json["photo"],
        emailcc: json["emailcc"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "subject": subject,
        "fecha": fecha,
        "sender": sender,
        "senderemail": senderemail,
        "mensaje": mensaje,
        "isread": isread,
        "photo": photo,
        "emailcc": emailcc,
    };
}
