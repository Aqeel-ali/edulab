import 'package:edulab/Pages/login&singUp/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'Pages/splash&onboarding_Screens/splashPage.dart';
import 'theme/theme.dart';
import 'theme/theme_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
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
      home: LoginScreen(),
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
