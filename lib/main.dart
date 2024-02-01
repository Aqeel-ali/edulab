import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'Pages/splash&onboarding_Screens/splashPage.dart';
import 'theme/theme.dart';

import 'theme/theme_manager.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCW3e-Za2_CsFZ4j6wffm1yUhDVfB3v9-s",
      appId: '1:210215542435:android:9dad9053f465c61f6a6916',
      messagingSenderId: '210215542435',
      projectId: 'edulab-5171e',
    ),
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thememode = ref.watch(themeModeProvider);

    print(thememode);
    return MaterialApp(
      themeMode: thememode ? ThemeMode.light : ThemeMode.dark,
      theme: theme().lightTheme,
      darkTheme: theme().darkTheme,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', ''), // Arabic, no country code
      ],
    );
  }
}
