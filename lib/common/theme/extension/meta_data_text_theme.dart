import 'package:flutter/material.dart';

class MetaDataTextTheme extends ThemeExtension<MetaDataTextTheme> {
  final TextStyle metaData1;
  final TextStyle metaData2;
  final TextStyle metaData3;

  MetaDataTextTheme({
    required this.metaData1,
    required this.metaData2,
    required this.metaData3,
  });

  @override
  ThemeExtension<MetaDataTextTheme> copyWith({
    TextStyle? metaData1,
    TextStyle? metaData2,
    TextStyle? metaData3,
  }) {
    return MetaDataTextTheme(
      metaData1: metaData1 ?? this.metaData1,
      metaData2: metaData2 ?? this.metaData2,
      metaData3: metaData3 ?? this.metaData3,
    );
  }

  @override
  ThemeExtension<MetaDataTextTheme> lerp(
    covariant ThemeExtension<MetaDataTextTheme>? other,
    double t,
  ) {
    return MetaDataTextTheme(
      metaData1: metaData1,
      metaData2: metaData2,
      metaData3: metaData3,
    );
  }
}
