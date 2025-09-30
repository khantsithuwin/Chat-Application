import 'package:flutter/material.dart';

import '../../../../common/theme/extension/color_brand.dart';
import '../../../../common/widgets/brand_button_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = TextTheme.of(context);
    ColorBrand colorBrand = Theme.of(context).extension()!;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              decoration: InputDecoration(
                fillColor: colorScheme.surfaceContainerHighest,
                filled: true,
                hintText: "Email",
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              decoration: InputDecoration(
                fillColor: colorScheme.surfaceContainerHighest,
                filled: true,
                hintText: "Password",
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 16.0),
            BrandButtonWidget(text: "Login", onPressed: () {}),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                SizedBox(width: 8.0),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Login",
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorBrand.brandDefault,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
