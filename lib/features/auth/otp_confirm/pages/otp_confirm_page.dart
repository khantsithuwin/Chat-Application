import 'package:chat_application/features/auth/otp_confirm/data/notifier/otp_confirm_notifier.dart';
import 'package:chat_application/features/auth/otp_confirm/data/notifier/otp_confirm_state_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OtpConfirmPage extends ConsumerStatefulWidget {
  const OtpConfirmPage({super.key});

  @override
  ConsumerState<OtpConfirmPage> createState() => _OtpConfirmPageState();
}

class _OtpConfirmPageState extends ConsumerState<OtpConfirmPage> {
  final OtpConfirmProvider _otpConfirmProvider = OtpConfirmProvider(
    () => OtpConfirmNotifier(),
  );

  bool _isRedirect = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    GoRouterState state = GoRouterState.of(context);
    String? email = state.extra.toString();

    OtpConfirmNotifier notifier = ref.read(_otpConfirmProvider.notifier);
    OtpConfirmStateModel stateModel = ref.watch(_otpConfirmProvider);

    bool isLoading = stateModel.isLoading;
    bool isSuccess = stateModel.isSuccess;
    bool isFailed = stateModel.isFailed;

    ref.listen(_otpConfirmProvider, (oldState, newState) {
      if (newState.isSuccess && !_isRedirect) {
        _isRedirect = true;
        context.go("/login");
      }
    });

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(title: Text("Confirm OTP")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading && !isSuccess && !isFailed)
            Center(child: CircularProgressIndicator()),
          if (isSuccess && !isLoading && !isFailed)
            Center(
              child: Text(
                "Success",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (isFailed && !isSuccess && !isLoading)
            Center(
              child: Column(
                children: [
                  Text(
                    "Failed",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      notifier.tryAgain();
                    },
                    child: Text("Try Again"),
                  ),
                ],
              ),
            ),
          if (!isFailed && !isSuccess && !isLoading)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Enter Code",
                      style: textTheme.displayMedium?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "We have sent you an OTP with the code to $email",
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      keyboardType: TextInputType.number,
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        fillColor: colorScheme.surfaceContainerHighest,
                        filled: true,
                        hintText: "Enter the 4-digits code",
                        border: InputBorder.none,
                      ),
                      onSubmitted: (String? otp) {
                        if (otp != null && otp.length == 4) {
                          notifier.verifyEmail(email: email, otpCode: otp);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Enter the correct OTP(4 digits)"),
                            ),
                          );
                        }
                      },
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
