import 'package:flutter/material.dart';
import 'package:flutter_responsive/extension_methods.dart';

import '../datas/models/persona.dart';

class PersonaWidget extends StatelessWidget {
  const PersonaWidget(
  this.persona, 
  {Key? key, 
  this.onTap, 
  this.cardColor = const Color(0xFF0A5DA0),
  this.selectedColor= Colors.lightBlue}
  ) : super(key: key);

  final Persona persona;
  final void Function()? onTap;
  final Color cardColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    Row _subtitle;

    if (context.isMobile() || 
    (context.isTablet() && context.width() > 750) ||
    (context.isDesktop()  && context.width() > 1500))

    {
      _subtitle = Row(
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(Icons.mail, color: Colors.white38, size: 16)),
          Expanded(
            child: Text(persona.email,
                style: const TextStyle(color: Colors.white)),
          )
        ],
      );
    } else {
      _subtitle = Row();
    }

    return Container(
      color: selectedColor,
      //constraints: const BoxConstraints(maxWidth: 400, minWidth: 100),
     // width: 400,
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        margin: const EdgeInsets.only(top: 0.5),
        color:  cardColor,
        child: ListTile(
            onTap: onTap,
            selected: persona.personaid > 0,
            selectedColor: selectedColor,
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(persona.photo),
              backgroundColor: cardColor,
            ),
            title: Text(
              persona.fullName,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: _subtitle,
            trailing: const Icon(Icons.keyboard_arrow_right,
                color: Colors.white38, size: 20.0)),
      ),
    );
  }
}
