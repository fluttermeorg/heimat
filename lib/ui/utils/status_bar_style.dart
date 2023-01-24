import 'package:flutter/services.dart';
import 'package:heimat/ui/utils/colors.dart';

SystemUiOverlayStyle statusBarStyle({bool isDark = false}) {
  return SystemUiOverlayStyle(
    statusBarColor: transparent,
    statusBarBrightness: isDark ? Brightness.light : Brightness.dark,
    statusBarIconBrightness: isDark ? Brightness.dark : Brightness.light,
    systemNavigationBarColor: transparent,
    systemNavigationBarDividerColor: transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
}
