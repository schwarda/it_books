import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_bloc/bloc/book_bloc.dart';
import 'package:http_bloc/pages/search_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
    return RepositoryProvider(
      create: (context) => BookBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IT Books',
        home: SearchPage(),
      ),
    );
  }
}
