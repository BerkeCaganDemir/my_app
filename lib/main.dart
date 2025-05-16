import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'ui/screens/getting_started/getting_started_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Podkes',
      theme: AppTheme.dark, 
      home:  GettingStartedPage(),
    );
  }
}
