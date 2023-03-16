import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/book_bloc.dart';
import '../components/background.dart';
import '../theme/app_colors.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Background(color: Colors.red)),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  'Problem with connection to the database.\nPlease try to check if you are connected to the internet.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'AmaticSC', fontSize: 38)),
              Image.asset('assets/img/error.png'),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor, shape: BoxShape.circle),
                width: 70,
                height: 70,
                child: IconButton(
                  onPressed: () {
                    context.read<BookBloc>().add(BookInitialEvent());
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
