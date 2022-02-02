import 'package:flutter/cupertino.dart';

enum eDeviceType { mobil, tablet, desktop, tv }

/// Try convert string to Int. If convertion failed, return null
extension ContextExtension on BuildContext {
  eDeviceType deviceType() {
    if (isMobile()) return eDeviceType.mobil;
    if (isTablet()) return eDeviceType.tablet;
    if (isDesktop()) return eDeviceType.desktop;
    return eDeviceType.mobil;
  }

  bool isMobile() => width() < 550;

  bool isTablet() =>
      width() >= 550 &&
      width() < 1000;

  bool isDesktop() => width() >= 1000;

    double width() => MediaQuery.of(this).size.width;

    double height() => MediaQuery.of(this).size.height;
}
