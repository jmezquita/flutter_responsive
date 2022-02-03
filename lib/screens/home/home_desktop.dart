import 'package:flutter/material.dart';
import 'package:flutter_responsive/datas/models/email_model.dart';
import 'package:flutter_responsive/datas/models/persona.dart';
import 'package:flutter_responsive/screens/email_body.dart';
import 'package:flutter_responsive/widgets/custom_appbar.dart';
import 'package:flutter_responsive/widgets/custom_drawer.dart';
import 'package:flutter_responsive/widgets/persona_widget.dart';

import '../../widgets/email_widgets.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop(this.personas, {Key? key}) : super(key: key);

  final List<Persona>? personas;

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  Email _email = Email();

  //List<Persona>? personas;

  late ScrollController _scrollControllerPersona, _scrollControllerEmailSender;

  List<Persona> _personas = [];
  Persona _persona = Persona();

  @override
  void initState() {
    super.initState();
    _scrollControllerPersona = ScrollController();
    _scrollControllerEmailSender = ScrollController();

    _personas = widget.personas!.toList();
    _persona = _personas[0];
    _email = _personas[0].emails[0];
    // _scrollControllerOne.addListener(() {});
  }

  @override
  void dispose() {
    _scrollControllerPersona.dispose();
    _scrollControllerEmailSender.dispose();
    super.dispose();
  }

  //int _personaId = 0;

  @override
  Widget build(BuildContext context) {
    int _total = _persona.emails.length;
    int _leidos = _persona.emails.where((w) => w.isread == true).length;

    return Scaffold(
        drawer: const CustomDrawer(backgroundColor: Color(0xFF125F48)),
        appBar: const CustomAppBar(
            title: "Soy una Desktop", backgroundColor: Color(0xFF125F48)),
        body: Row(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollControllerPersona,
                physics: const ClampingScrollPhysics(),
                child: ListView.builder(
                  itemCount: _personas.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      PersonaWidget(_personas[index],
                          cardColor: const Color(0xFF107456),
                          selectedColor: const Color((0xFF3E997F)),
                          onTap: () => setState(() {
                                _persona = _personas[index];
                              })),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                controller: _scrollControllerEmailSender,
                physics: const ClampingScrollPhysics(),
                child: ListView.builder(
                  itemCount: _persona.emails.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => EmailWidget(
                    _persona.emails[index],
                    onTap: () => setState(() {
                      _email = _persona.emails[index];
                      _persona.emails[index].isread = true;
                    }),
                  ),
                ),
              ),
            ),
            Expanded(flex: 2, child: EmailBody(_email, showAppbar: false))
          ],
        ),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: const Color(0xFF125F48),
                primaryColor: Colors.purple,
                backgroundColor: const Color(0xFF125F48)),
            child: Container(
              color: const Color(0xFF125F48),
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                height: 30,
                child: Row(
                   // crossAxisAlignment: CrossAxisAlignment.baseline,
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Personas: ${_personas.length}",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text("Total Emails: $_total",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text("Leidos: $_leidos",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text("No leidos: ${_total - _leidos}",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold))
                    ]),
              ),
            )));
  }
}
