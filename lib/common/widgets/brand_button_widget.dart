import 'package:flutter/material.dart';

import '../theme/extension/color_brand.dart';
import '../theme/extension/color_neutral.dart';

class BrandButtonWidget extends StatelessWidget {
  const BrandButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    ColorBrand colorBrand = Theme.of(context).extension()!;
    ColorNeutral colorNeutral = Theme.of(context).extension()!;
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: colorBrand.brandDefault,
          foregroundColor: colorNeutral.buttonText,
          textStyle: textTheme.bodyLarge?.copyWith(
            color: colorNeutral.buttonText,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
