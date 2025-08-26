import 'package:flutter/material.dart';
import 'package:circles/core/config/themes/custom_theme_extension.dart';

extension contextExtention on BuildContext {
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }

  bool get isLightMode {
    return Theme.of(this).brightness == Brightness.light;
  }

  CustomColors get colors {
    return Theme.of(this).extension<CustomColors>()!;
  }
}
