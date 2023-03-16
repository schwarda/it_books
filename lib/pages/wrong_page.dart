import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/book_bloc.dart';
import '../theme/app_colors.dart';

class WrongPage extends StatelessWidget {
  const WrongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Something went wrong.\nPlease try again.',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'AmaticSC', fontSize: 38)),
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
    );
  }
}
