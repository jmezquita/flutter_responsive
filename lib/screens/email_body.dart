import 'package:flutter/material.dart';
import 'package:flutter_responsive/datas/models/email_model.dart';

class EmailBody extends StatelessWidget {
  final bool showAppbar;
  final Email email;

  const EmailBody(this.email, {Key? key, this.showAppbar = true})
      : super(key: key);




  Widget body() {

final ScrollController _scrollControllerEmailBody =ScrollController();

    final _header = Card(
      // Con esta propiedad modificamos la forma de nuestro card
      // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      // Con esta propiedad agregamos margen a nuestro Card
      // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
      margin: const EdgeInsets.only(bottom: 30, top: 15),

      elevation: 10,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15, left: 15),
            child: Text(email.subject,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Icon(
                Icons.account_circle,
                size: 80,
                color: Colors.black38,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    email.sender,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("<${email.senderemail}>",
                  style:const TextStyle(color: Colors.black38,fontWeight: FontWeight.bold)),
                     Text(email.fecha,
                     style:const TextStyle(color: Colors.black38, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
        ],
      ),
    );

    return //Stack(
        //children: <Widget>[

    Container(
      margin: const EdgeInsets.only(left: 5, right: 10),
      //margin: const EdgeInsets.only(top: 5.0, left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _header,
        SingleChildScrollView(
                  controller: _scrollControllerEmailBody,
                   // physics: const NeverScrollableScrollPhysics(),
          reverse: true,
          physics: const ClampingScrollPhysics(),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                children:  <TextSpan>[
              TextSpan(text: email.mensaje,
                style: const TextStyle(fontSize: 16, color: Colors.black54),)
                ]
  
              ),
              // TextSpan(text: ' world!'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (showAppbar) {
      return Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
            title: Text(email.sender),
          ),
          body: body());
    } else {
      return Scaffold(backgroundColor: Colors.white70, body: body());
    }
  }
}
