import 'package:flutter/material.dart';
import 'package:oru_phones/app_state.dart';
import 'package:oru_phones/globals.dart';
import 'package:provider/provider.dart';
import 'homepage/homepage.dart';

void main() {
  var app = ChangeNotifierProvider(
    create: (context) => AppState(),
    child: const MyApp(),
  );
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.light(primary: Globals.primary),
          searchViewTheme: const SearchViewThemeData().copyWith(
            surfaceTintColor: Colors.white,
            elevation: 3,
            dividerColor: Colors.grey[300],
          )),
      home: const HomePage(),
    );
  }
}
