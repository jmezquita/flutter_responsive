import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_responsive/datas/models/persona.dart';

import 'models/email_model.dart';

///Clase de datos
///
///Esta clase nos servira para hacer  la funcion de base de dato
class Data {
  //List<Persona> _personas = [];
  //List<Email> _emails = [];
  //List<FacturaModel> _pedidos = [];

  ///List<Persona> get personas => _personas;
  //List<Email> get emails => _emails;
  //List<FacturaModel> get pedidos => _pedidos;

  Future<List<Persona>> getPersona() async {

    List<Email> _emails = [];
    List<Persona> _personas = [];

    String _response = await rootBundle.loadString('lib/datas/emails.json');
    var _data = jsonDecode(_response);
    // _personaList = photoFromJson(response.bo);
    //get Emails
    for (var i in _data) {
      _emails.add(Email.fromJson(i));
    }

  //get personas
    _response = await rootBundle.loadString('lib/datas/personas.json');
    _data = jsonDecode(_response);
    // _personaList = photoFromJson(response.bo);

    Persona _persona = Persona();
  //get random Emails
    for (var i in _data) {
      _persona = Persona.fromJson(i);
      _persona.emails = (_emails.toList()..shuffle()).take(50).toList();
      _personas.add(_persona);
    }

    return _personas;
  }
/*
  List<Email> getEmails() {
    var randomItem = (_emails?.toList()..shuffle()).take(50).toList();
    return randomItem;
  }
  */
}
