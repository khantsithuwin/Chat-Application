import 'package:chat_application/features/auth/login/pages/login_page.dart';
import 'package:chat_application/features/auth/signup/pages/signup_page.dart';
import 'package:chat_application/features/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: "splash",
      path: '/',
      builder: (context, state) {
        return SplashScreen();
      },
    ),
    GoRoute(
      name: "login",
      path: "/login",
      builder: (context, state) {
        return LoginPage();
      },
    ),
    GoRoute(
      name: "signup",
      path: "/signup",
      builder: (context, state) {
        return SignupPage();
      },
    ),
  ],
);
