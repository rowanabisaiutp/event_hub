import 'package:digital_event_hub/sesion/login/login.dart';
import 'package:digital_event_hub/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(  ChangeNotifierProvider(
      create: (_) => ThemeNotifier(theme1),
      child: MyApp(),
    ),);


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) {
        return MaterialApp(
          theme: theme.currentTheme,
          home: SignInScreen(),
        );
      },
    );
  }
}
// import 'package:digital_event_hub/sesion/login/login.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SignInScreen(),
//     );
//   }
// }