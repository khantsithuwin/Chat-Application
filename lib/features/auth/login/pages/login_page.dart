import 'package:chat_application/common/theme/extension/color_brand.dart';
import 'package:chat_application/common/widgets/brand_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = TextTheme.of(context);
    ColorBrand colorBrand = Theme.of(context).extension()!;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(title: Text("Login")),
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
                  "Don't have an account?",
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                SizedBox(width: 8.0),
                InkWell(
                  onTap: () {
                    context.push("/signup");
                  },
                  child: Text(
                    "SignUp",
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
