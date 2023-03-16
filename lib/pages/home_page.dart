import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/book_bloc.dart';
import '../components/background.dart';
import '../constants.dart';
import '../theme/app_colors.dart';
import '../widgets/text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Background(color: AppColors.primaryColor)),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('IT Books',
            style: TextStyle(fontFamily: 'AmaticSC', fontSize: 50)),
        Image.asset('assets/img/book_ilustration-min.png'),
        const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        ContainerTextField(
            hintText: 'Search for IT books..',
            func: (value) {
              setState(() {
                ApiConstants.endpoint = value;
              });
              context.read<BookBloc>().add(BookLoadEvent(value));
            }),
      ]),
    ]);
  }
}
