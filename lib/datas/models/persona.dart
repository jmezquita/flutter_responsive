// To parse this JSON data, do
//
//     final persona = personaFromJson(jsonString);

import 'dart:convert';

import 'email_model.dart';

Persona personaFromJson(String str) => Persona.fromJson(json.decode(str));

String personaToJson(Persona data) => json.encode(data.toJson());

class Persona {
  Persona({
    this.personaid = 0,
    this.firstname = '',
    this.lastname = '',
    this.email = '',
    this.telefono = '',
    this.photo = '',
  });

  int personaid;
  String firstname;
  String lastname;
  String email;
  String telefono;
  String photo;
  String get  fullName =>'$firstname $lastname';
  List<Email> emails =[]; 
   

  factory Persona.fromJson(Map<String, dynamic> json) => Persona(
        personaid: json["personaid"]??0,
        firstname: json["firstname"]??'',
        lastname: json["lastname"]??'',
        email: json["email"]??'',
        telefono: json["telefono"]??'',
        photo: json["photo"]??'',
     
      );

  Map<String, dynamic> toJson() => {
        "personaid": personaid,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "telefono": telefono,
        "photo": photo,
      };
}
