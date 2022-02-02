import 'package:flutter/material.dart';

import 'package:flutter_responsive/datas/models/email_model.dart';
import 'package:flutter_responsive/screens/email_body.dart';

class EmailWidget extends StatefulWidget {
  const EmailWidget(this.email, {Key? key, this.onTap}) : super(key: key);

  final Email email;
  final void Function()? onTap;

  @override
  State<EmailWidget> createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {



  

  TextStyle style(bool isRead) {
    if (isRead) {
      return const TextStyle(
          fontWeight: FontWeight.w500, color: Colors.black54, fontSize: 15.5);
    } else {
      return const TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.blueAccent,
          fontSize: 15.5);
    }
  }

  Container emailIcon(bool isRead) {
    return Container(
      margin: const EdgeInsets.only(right: 25.0),
      height: 40,
      width: 40,
      child: isRead
          ? const Icon(Icons.email_outlined, color: Colors.black38, size: 30)
          : const Icon(Icons.mail, color: Colors.blue, size: 30),
    );
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: widget.onTap ??
          () => {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => EmailBody(widget.email))),
                setState(() {
                  widget.email.isread = true;
                }),
              },
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: 14.0, right: 14.0, top: 5.0, bottom: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.account_circle,
                size: 55.0,
                color: Colors.black38,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.email.sender,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black54,
                                fontSize: 17.0),
                          ),
                          Text(
                            widget.email.fecha,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                                fontSize: 13.5),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(widget.email.subject,
                                    style: style(widget.email.isread)),
                                Text(
                                  '${widget.email.mensaje.substring(0, 50)}...',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                      fontSize: 15.5),
                                )
                              ],
                            ),
                          ),
                          emailIcon(widget.email.isread)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ]),
    );
  }
}
