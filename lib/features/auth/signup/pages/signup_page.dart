import 'package:flutter/material.dart';

import '../../../../common/theme/extension/color_brand.dart';
import '../../../../common/widgets/brand_button_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _password;

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
        child: Form(
          key: _signupFormKey,
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
                  hintText: "Name",
                  border: InputBorder.none,
                ),
                validator: (String? name) {
                  if (name != null && name.length < 3) {
                    return "Please enter name above 3 characters";
                  }
                  return null;
                },
                onSaved: (String? name) {
                  _name = name;
                },
              ),
              SizedBox(height: 8.0),
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
                validator: (String? email) {
                  if (email == null || email.isEmpty || !email.contains('@')) {
                    return "Please enter Email correctly";
                  }
                  return null;
                },
                onSaved: (String? email) {
                  _email = email;
                },
              ),
              SizedBox(height: 8.0),
              TextFormField(
                obscureText: true,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                decoration: InputDecoration(
                  fillColor: colorScheme.surfaceContainerHighest,
                  filled: true,
                  hintText: "Password",
                  border: InputBorder.none,
                ),
                validator: (String? password) {
                  if (password != null && password.length < 6) {
                    return "Password must have at least 6";
                  }
                  return null;
                },
                onSaved: (String? password) {
                  _password = password;
                },
              ),
              SizedBox(height: 16.0),
              BrandButtonWidget(
                text: "Login",
                onPressed: () {
                  FormState? formState = _signupFormKey.currentState;
                  formState?.save();
                  if (formState?.validate() == true) {}
                },
              ),
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
      ),
    );
  }
}
