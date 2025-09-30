import 'package:flutter/material.dart';

class ColorNeutral extends ThemeExtension<ColorNeutral> {
  final Color neutralLine;
  final Color buttonText;

  ColorNeutral({required this.neutralLine, required this.buttonText});

  @override
  ThemeExtension<ColorNeutral> copyWith({
    Color? neutralLine,
    Color? buttonText,
  }) {
    return ColorNeutral(
      neutralLine: neutralLine ?? this.neutralLine,
      buttonText: buttonText ?? this.buttonText,
    );
  }

  @override
  ThemeExtension<ColorNeutral> lerp(
    covariant ThemeExtension<ColorNeutral>? other,
    double t,
  ) {
    return ColorNeutral(neutralLine: neutralLine, buttonText: buttonText);
  }
}
