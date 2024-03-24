import 'package:chat_app/common/widgets/error.dart';
import 'package:chat_app/common/widgets/loader.dart';
import 'package:chat_app/features/auth/controller/auth_controller.dart';
import 'package:chat_app/features/auth/screens/login_screen.dart';
import 'package:chat_app/features/auth/screens/user_information_screen.dart';
import 'package:chat_app/features/ladnding/screens/landing_screen.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/router.dart';
import 'package:chat_app/features/chat/screens/mobile_chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/common/utils/colors.dart';
import 'package:chat_app/mobile_layout_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// C:\Users\rawa>flutter --version
// Flutter 3.13.9 • channel stable • https://github.com/flutter/flutter.git
// Framework • revision d211f42860 (5 months ago) • 2023-10-25 13:42:25 -0700
// Engine • revision 0545f8705d
// Tools • Dart 3.1.5 • DevTools 2.25.0

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp UI',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: const AppBarTheme(
            color: appBarColor,
          )),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(userDataAuthProvider).when(
          data: (user) {
            if (user == null) {
              return const LandingScreen();
            } else {
              return const MobileLayoutScreen();
            }
          },
          error: (err, trace) {
            return ErrorScreen(error: err.toString());
          },
          loading: () => const Loader()),
    );
  }
}
