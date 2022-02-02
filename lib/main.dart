import 'dart:io';
import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter_responsive/screens/home/home_page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    //setWindowTitle("Emjemplo del diseño responsivo en desktop y web");
    //setWindowMinSize(const Size(300, 600));
    //setWindowMaxSize(const Size(double.infinity, 800));
    //  Size size = await DesktopWindow.getWindowSize();
    DesktopWindow.setMinWindowSize(const Size(400, 500));

  
    //setWindowSize(Size(1024, 800));
    // testWindowFunctions();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
