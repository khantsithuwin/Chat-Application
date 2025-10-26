import 'package:chat_application/features/auth/login/pages/login_page.dart';
import 'package:chat_application/features/auth/otp_confirm/pages/otp_confirm_page.dart';
import 'package:chat_application/features/auth/signup/pages/signup_page.dart';
import 'package:chat_application/features/home/chat_details/page/chat_details_page.dart';
import 'package:chat_application/features/home/chat_lists/page/chat_list_page.dart';
import 'package:chat_application/features/home/contacts/page/contact_page.dart';
import 'package:chat_application/features/home/home_page.dart';
import 'package:chat_application/features/home/setting/page/setting_page.dart';
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
    GoRoute(
      name: "confirm_otp",
      path: "/confirm_otp",
      builder: (context, state) {
        return OtpConfirmPage();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) {
        return HomePage(shell: shell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: "contact",
              path: "/contact",
              builder: (context, state) {
                return ContactPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: "chat_list",
              path: "/chat_list",
              builder: (context, state) {
                return ChatListPage();
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              name: "setting",
              path: "/setting",
              builder: (context, state) {
                return SettingPage();
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: "chat-detail",
      path: "/chat-detail",
      builder: (context, state) {
        return ChatDetailsPage();
      },
    ),
  ],
);
