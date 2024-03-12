import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photography_flutter_firebase_fullstack_application/Core/Constants/pallete.dart';
import 'package:photography_flutter_firebase_fullstack_application/Features/Authentication/Riverpod/providers.dart';
import 'package:photography_flutter_firebase_fullstack_application/Features/Authentication/Screens/auth_screen.dart';
import 'package:photography_flutter_firebase_fullstack_application/Features/Feed/Screens/bottom_navigation.dart';
import 'package:photography_flutter_firebase_fullstack_application/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LensLyfe',
      theme: ThemeData(
        scaffoldBackgroundColor: Pallete.bgColor,
      ),
      home: Consumer(
        builder: (context, ref, child) {
          final userState = ref.watch(authStateProvider);
          return userState.when(
            data: (data) {
              if (data != null) {
                return const BottomNavigationTabs();
              }
              return const AuthScreen();
            },
            error: (error, stackTrace) => const Center(
              child: Text('There is an Internal error'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
