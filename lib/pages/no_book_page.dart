import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_bloc/theme/app_colors.dart';

import '../bloc/book_bloc.dart';

class NoBookPage extends StatelessWidget {
  const NoBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Sorry there is no such a book.',
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
