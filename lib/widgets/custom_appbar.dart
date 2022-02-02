import 'package:flutter/material.dart';
/*
class CustomAppBar extends PreferredSizeWidget implements PreferredSizeWidget{

   final Widget child;
  final double height


  const CustomAppBar({Key? key,
  this.title="Soy un Movil",
  this.backgroundColor = const Color(0xff0277BD)})
      

   final String title;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
   
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: const <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 13.0),
          child: Icon(
            Icons.search,
            size: 25.0,
          ),
        ),
      ],
    );
  }
}
*/

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;


  const CustomAppBar({
    Key? key,
    this.title = "Soy un Movil",
    this.backgroundColor = const Color(0xFF00466F),
  }) : super(key: key);

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      /*leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(fotoPath),
       // backgroundColor: backgroundColor,
      ),*/
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: const <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 13.0),
          child: Icon(
            Icons.search,
            size: 25.0,
          ),
        ),
      ],
    );
  }
}
