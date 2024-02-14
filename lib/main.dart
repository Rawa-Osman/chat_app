import 'package:chat_app/features/auth/screens/login_screen.dart';
import 'package:chat_app/features/auth/screens/user_information_screen.dart';
import 'package:chat_app/features/ladnding/screens/landing_screen.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/router.dart';
import 'package:chat_app/screens/mobile_chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/colors.dart';
import 'package:chat_app/screens/mobile_layout_screen.dart';
import 'package:chat_app/screens/web_layout_screen.dart';
import 'package:chat_app/utils/responsive_layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp UI',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: const AppBarTheme(
            color: appBarColor,
          )),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const LoginScreen(),
    );
  }
}
