import 'package:flutter/material.dart';
import 'package:flutter_responsive/datas/data.dart';
import 'package:flutter_responsive/datas/models/persona.dart';
import 'package:flutter_responsive/extension_methods.dart';
import 'package:flutter_responsive/screens/home/home_desktop.dart';
import 'package:flutter_responsive/screens/home/home_movil.dart';

import 'home_tablet.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  //int personaId = 0;

  final Data _data = Data();
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Persona>>(
        future: _data.getPersona(),
        builder: (BuildContext context, AsyncSnapshot<List<Persona>> snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return LayoutBuilder(builder: (context, bcons) {

              switch (context.deviceType()) {
                case eDeviceType.mobil:
                  return HomeMovil(snapshot.data!.toList());
                case eDeviceType.tablet:
                 return HomeTable(snapshot.data!.toList());
                default:
                 // return const Text("HolAaaaaaaa");
                return HomeDesktop(snapshot.data!.toList());
              }
            });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });

  }
}
