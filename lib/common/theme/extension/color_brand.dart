import 'package:flutter/material.dart';

class ColorBrand extends ThemeExtension<ColorBrand> {
  final Color brandDefault;
  final Color brandBackground;

  ColorBrand({required this.brandDefault, required this.brandBackground});

  @override
  ThemeExtension<ColorBrand> copyWith({
    Color? brandDefault,
    Color? brandBackground,
  }) {
    return ColorBrand(
      brandDefault: brandDefault ?? this.brandDefault,
      brandBackground: brandBackground ?? this.brandBackground,
    );
  }

  @override
  ThemeExtension<ColorBrand> lerp(
    covariant ThemeExtension<ColorBrand>? other,
    double t,
  ) {
    return ColorBrand(
      brandDefault: brandDefault,
      brandBackground: brandBackground,
    );
  }
}
