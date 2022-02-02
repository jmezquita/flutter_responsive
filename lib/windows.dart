import 'package:desktop_window/desktop_window.dart';
import 'dart:ui';


//enum FormWindowsState { normal, minimized, maximize }

class Windows {


  Size get physicalSize  => window.physicalSize;

  Size _size = const Size(0,0);
  Size get size => _size;

  Windows() {
    setWindowsState();
  }

  Future setWindowsState() async {
    _size = await DesktopWindow.getWindowSize();
  }
}


  /*

  final isFullScreen = DesktopWindow.getFullScreen();

  final size = DesktopWindow.getWindowSize();

  FormWindowsState _windowsState = FormWindowsState.normal;

  FormWindowsState get windowsState {
    return _windowsState;
  }

  // Creating the setter method
  // to set the input in Field/Property
  set windowsState(FormWindowsState value) {
    if (_windowsState != value) {
      switch (value) {
        case FormWindowsState.maximize:
          DesktopWindow.setFullScreen(true);

          break;

        case FormWindowsState.minimized:
          break;
        case FormWindowsState.normal:
        default:
      }

      _windowsState = value;
    }
  }

  Future setWindowsState(FormWindowsState value) async {
    switch (value) {
      case FormWindowsState.maximize:
        await DesktopWindow.setFullScreen(true);
        break;

      case FormWindowsState.minimized:
        break;
      case FormWindowsState.normal:
      default:
        if (_isFullScreen) {
        } else {}

        await DesktopWindow.setFullScreen(false);
    }
  }

  static Future testWindowFunctions() async {
    //Size size = await DesktopWindow.getWindowSize();
    //print(size);
    //await DesktopWindow.setWindowSize(const Size(500, 500));

    //await DesktopWindow.setMinWindowSize(const Size(400, 400));
    //await DesktopWindow.setMaxWindowSize(const Size(800, 800));

    //await DesktopWindow.resetMaxWindowSize();
    // await DesktopWindow.toggleFullScreen();
    // ;
    await DesktopWindow.setFullScreen(true);
    // await DesktopWindow.setFullScreen(false);
  }
}
*/