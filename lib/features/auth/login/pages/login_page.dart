import 'package:chat_application/common/theme/extension/color_brand.dart';
import 'package:chat_application/common/widgets/brand_button_widget.dart';
import 'package:chat_application/features/auth/login/data/notifier/login_state_model.dart';
import 'package:chat_application/features/auth/login/data/notifier/login_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final LoginProvider _provider = LoginProvider(() {
    return LoginStateNotifier();
  });

  final GlobalKey<FormState> _globalKeyLogin = GlobalKey();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = TextTheme.of(context);
    ColorBrand colorBrand = Theme.of(context).extension()!;

    LoginStateNotifier notifier = ref.read(_provider.notifier);
    LoginStateModel stateModel = ref.watch(_provider);

    bool isLoading = stateModel.isLoading;
    bool isSuccess = stateModel.isSuccess;
    bool isFailed = stateModel.isFailed;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(title: Text("Login")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading && !isFailed && !isSuccess)
            Center(child: CircularProgressIndicator()),
          if (isFailed && !isLoading && !isSuccess)
            Center(
              child: Column(
                children: [
                  Text(stateModel.errorMessage),
                  SizedBox(height: 16.0),
                  OutlinedButton(
                    onPressed: () {
                      notifier.tryAgain();
                    },
                    child: Text("Try Again"),
                  ),
                ],
              ),
            ),
          if (isSuccess && !isFailed && !isLoading)
            Center(
              child: Text(
                "Login Success",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (!isSuccess && !isFailed && !isLoading)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _globalKeyLogin,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                      decoration: InputDecoration(
                        fillColor: colorScheme.surfaceContainerHighest,
                        filled: true,
                        hintText: "Email",
                        border: InputBorder.none,
                      ),
                      validator: (String? email) {
                        if (email == null ||
                            email.isEmpty ||
                            !email.contains('@')) {
                          return "Please enter email correctly";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (String? email) {
                        _email = email;
                      },
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                      decoration: InputDecoration(
                        fillColor: colorScheme.surfaceContainerHighest,
                        filled: true,
                        hintText: "Password",
                        border: InputBorder.none,
                      ),
                      validator: (String? password) {
                        if (password != null && password.length < 6) {
                          return "Please enter 6 min passwords";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (String? password) {
                        _password = password;
                      },
                    ),
                    SizedBox(height: 16.0),
                    BrandButtonWidget(
                      text: "Login",
                      onPressed: () {
                        final state = _globalKeyLogin.currentState;
                        state?.save();
                        if (state?.validate() == true) {
                          notifier.login(email: _email!, password: _password!);
                        }
                      },
                    ),
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
            ),
        ],
      ),
    );
  }
}
