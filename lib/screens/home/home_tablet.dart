import 'package:flutter/material.dart';
import 'package:flutter_responsive/datas/models/persona.dart';
import 'package:flutter_responsive/widgets/email_widgets.dart';
import 'package:flutter_responsive/screens/email_body.dart';
import 'package:flutter_responsive/widgets/custom_appbar.dart';
import 'package:flutter_responsive/widgets/custom_drawer.dart';
import '../../widgets/persona_widget.dart';

class HomeTable extends StatefulWidget {
  const HomeTable(this.personas, {Key? key}) : super(key: key);

  final List<Persona>? personas;

  @override
  State<HomeTable> createState() => _HomeTableState();
}

class _HomeTableState extends State<HomeTable> {
  final ScrollController _scrollControllerPersona =ScrollController();
    final ScrollController _scrollControllerEmailSender =ScrollController();

  List<Persona> _personas = [];
  Persona _persona = Persona();

  @override
  void initState() {
    //_scrollControllerPersona = ScrollController();
   // _scrollControllerEmailSender = ScrollController();

    _personas = widget.personas!.toList();
    _persona = _personas[0];
    super.initState();
    // _scrollControllerOne.addListener(() {});
  }

  @override
  void dispose() {
    //_scrollControllerPersona.dispose();
    //_scrollControllerEmailSender.dispose();
    super.dispose();
  }

  //Persona _persona = widget.personas[0];
  // int _personaId = 0;
  // int emailId=0;

  int _indextap = 0;

  void ontapTapped(int index) {
    setState(() {
      _indextap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(backgroundColor: Colors.red),
        appBar: const CustomAppBar(
            title: "Soy una Table", backgroundColor: Colors.red),
        body: Row(
          children: <Widget>[
            Expanded(

              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                 controller: _scrollControllerPersona,
                child: ListView.builder(
                  itemCount: _personas.length,
                  shrinkWrap: true,
                  itemBuilder: (context, personaId) => PersonaWidget(
                      _personas[personaId],
                      cardColor: const Color(0xFFF25145),
                      selectedColor: const Color((0xFFB85952)), onTap: () {
                    _persona = _personas[personaId];
                    setState(() {});
                  }),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                  /*
                  scrollDirection: Axis.vertical,

                  
                  */
                   controller: _scrollControllerEmailSender,
                  child: ListView.builder(
                      itemCount: _persona.emails.length,
                      shrinkWrap: true,
                      itemBuilder: (context, emailIndex) => EmailWidget(
                            _persona.emails[emailIndex],
                            onTap: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      EmailBody(_persona.emails[emailIndex]))),
                              setState(() {
                                _persona.emails[emailIndex].isread = true;
                              }),
                            },
                          )),
                )),
          ],
        ),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.white, primaryColor: Colors.purple),
            child: BottomNavigationBar(
                currentIndex: _indextap,
                onTap: ontapTapped,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        color: Colors.red,
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search, color: Colors.red), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person, color: Colors.red), label: ""),
                ])));
  }
}
