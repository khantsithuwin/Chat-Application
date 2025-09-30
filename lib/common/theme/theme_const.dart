import 'package:flutter/material.dart';

import 'extension/color_brand.dart';
import 'extension/color_neutral.dart';
import 'extension/meta_data_text_theme.dart';

class ThemeConst {
  static ThemeData lightTheme() {
    ThemeData light = ThemeData.light();
    return light.copyWith(
      colorScheme: light.colorScheme.copyWith(
        surface: Color(0xffFFFFFF),
        onSurface: Color(0xff0F1828),
        surfaceContainerHighest: Color(0xffF7F7FC),
        onSurfaceVariant: Color(0xffADB5BD),
      ),
      extensions: [
        ColorBrand(
          brandDefault: Color(0xff002DE3),
          brandBackground: Color(0xffD2D5F9),
        ),
        ColorNeutral(
          neutralLine: Color(0xffEDEDED),
          buttonText: Color(0xffFFFFFF),
        ),
        _metaDataTextTheme,
      ],
    );
  }

  static ThemeData darkTheme() {
    ThemeData dark = ThemeData.dark();
    return dark.copyWith(
      colorScheme: dark.colorScheme.copyWith(
        surface: Color(0xff0F1828),
        onSurface: Color(0xffFFFFFF),
        surfaceContainerHighest: Color(0xff152033),
        onSurfaceVariant: Color(0xffADB5BD),
      ),
      extensions: [
        ColorBrand(
          brandDefault: Color(0xff375FFF),
          brandBackground: Color(0xffD2D5F9),
        ),
        ColorNeutral(
          neutralLine: Color(0xffF7F7FC),
          buttonText: Color(0xffFFFFFF),
        ),
        _metaDataTextTheme,
      ],
    );
  }

  static final MetaDataTextTheme _metaDataTextTheme = MetaDataTextTheme(
    metaData1: TextStyle(fontSize: 12.0),
    metaData2: TextStyle(fontSize: 10.0),
    metaData3: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400),
  );
}
