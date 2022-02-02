import 'package:flutter/material.dart';
import 'package:flutter_responsive/datas/models/persona.dart';
import 'package:flutter_responsive/widgets/custom_appbar.dart';
import 'package:flutter_responsive/widgets/custom_drawer.dart';

import '../../widgets/persona_widget.dart';

import '../../widgets/email_widgets.dart';
import '../../windows.dart';

class HomeMovil extends StatefulWidget {
  HomeMovil(this.personas, {Key? key}) : super(key: key);

  final List<Persona> personas;

  final Windows windows = Windows();

  @override
  State<HomeMovil> createState() => _HomeMovilState();
}

class _HomeMovilState extends State<HomeMovil> {
 // int personaId = 0;

  List<Persona> _personas = [];
  Persona _persona = Persona();

  @override
  void initState() {
    _personas = widget.personas.toList();
    _persona = _personas[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        appBar: const CustomAppBar(),
        body: ListView.builder(
            itemCount: _personas.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => PersonaWidget(_personas[index],
                onTap: () => {
                      _persona = _personas[index],
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return Scaffold(
                            appBar: AppBar(
                              title: Text(_persona.fullName),
                            ),
                            body: ListView.builder(
                                itemCount: _persona.emails.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => EmailWidget(
                                      _persona.emails[index],
                                      // title: widget.personas![personaId].emails[index].sender
                                    )),
                            bottomNavigationBar: Theme(
                                data: Theme.of(context).copyWith(
                                    canvasColor: Colors.white,
                                    primaryColor: Colors.purple),
                                child: BottomNavigationBar(items: const [
                                  BottomNavigationBarItem(
                                      icon:
                                          Icon(Icons.home, color: Colors.blue),
                                      label: ""),
                                  BottomNavigationBarItem(
                                      icon: Icon(Icons.search,
                                          color: Colors.blue),
                                      label: ""),
                                  BottomNavigationBarItem(
                                      icon: Icon(Icons.person,
                                          color: Colors.blue),
                                      label: ""),
                                ])));

                        //Scaffold(
                        //appBar: AppBar(
                        //title:  Text(
                        // widget.personas![index].fullName
                        //),
                      }))
                    })),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.white, primaryColor: Colors.purple),
            child: BottomNavigationBar(items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.blue), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.blue), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.blue), label: ""),
            ])));
  }
}
