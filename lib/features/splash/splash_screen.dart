import 'package:chat_application/common/widgets/brand_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/images/home_logo.png"),
                  SizedBox(height: 32.0),
                  Text(
                    "Connect easily with your family and friends over countries",
                    style: textTheme.displayMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Terms & Privacy Policy",
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    BrandButtonWidget(
                      text: "Start Messaging",
                      onPressed: () {
                        context.push("/login");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
