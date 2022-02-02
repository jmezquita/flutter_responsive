import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget 
{
  const CustomDrawer({Key? key,
  this.backgroundColor = const Color(0xFF00466F)}) : super(key: key);

  final Color backgroundColor;

 @override
  Widget build(BuildContext context) {
  return Drawer(
    child: Column(
  children:  <Widget>[
    UserAccountsDrawerHeader(
      decoration:  BoxDecoration(color: backgroundColor),
      accountName: const Text('Juan Carlos'),
      accountEmail: const Text('miemail@gmail.com'),
      currentAccountPicture: const Icon(
        Icons.account_circle,
        size: 50.0,
        color: Colors.white,
      ),
    ),
  ]
    )
);
  }
}
 